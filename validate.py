"""
Does additional checks to make sure the config is correct before actually running it.
This includes checking if all the given icons actually exist and are pathed correctly.

To make it really simple to figure out what exactly is wrong, errors are given in a simple
arrow chain starting at the server name and leading to the error. Elements in square brackets
indicate a field while other values indicate a named attribute.
"""

from typing import Tuple
import os
import dhall

# TODO: make sure correct options are used at places with
# limited amount of options. Might be able to implement in Dhall already


def validate_server(server: dict) -> Tuple[bool, str]:
    # make sure images exist
    icon = server.get("icon", None)
    if icon and not os.path.isfile(icon):
        return False, f"[icon] > icon at '{icon}' does not exist"
    banner = server.get("banner", None)
    if banner and not os.path.isfile(banner):
        return False, f"[banner] > banner at '{banner}' does not exist"

    valid, error = validate_multiple_channels(server["extraChannels"])
    if not valid:
        return False, "[extraChannels] > " + error

    # check for duplicate category names

    # check for duplicate channel names inside category
    for cat in server["categories"]:
        valid, error = validate_category(cat)
        if not valid:
            return False, "[categories] > " + error

    ems = set()
    for emote in server["emotes"]:
        if not (os.path.isfile(fp := emote["path"])):
            return False, f"[emotes] > emote at '{fp}' does not exist"
        if emote["name"] in ems:
            return False, f"[emotes] > duplicate emote name '{emote['name']}'"
        ems.add(emote["name"])

    stks = set()
    for sticker in server["stickers"]:
        if not (os.path.isfile(fp := sticker["path"])):
            return False, f"[stickers] > sticker at '{fp}' does not exist"
        if sticker["name"] in stks:
            return False, f"[stickers] > duplicate sticker name '{sticker['name']}'"
        stks.add(sticker["name"])

    return True, None


def validate_category(category: dict) -> Tuple[bool, str]:
    valid, error = validate_multiple_channels(category["channels"])
    if not valid:
        return False, f"{category['name']} > [channels] > " + error

    return True, None


def validate_channel(channel: dict) -> Tuple[bool, str]:
    return True, None


def validate_multiple_channels(channels: list) -> Tuple[bool, str]:
    # detect duplicate channel names
    chan_set = set()
    for chan in channels:
        valid, error = validate_channel(chan)
        if not valid:
            return False, error
        if chan["name"] in chan_set:
            return False, f"duplicate channel name '{chan['name']}'"
        chan_set.add(chan["name"])

    return True, None


def validate(fp: str):
    with open(fp, "r", encoding="utf-8") as f:
        config = dhall.load(f)

    errors = False
    for server in config:
        valid, error = validate_server(server)
        if valid:
            print(f"✓ CORRECT: {server['name']}")
        else:
            print(f"☓ INVALID: {server['name']} > {error}")
            errors = True

    if errors:
        exit(1)


def main():
    validate("configs/servers.dhall")


if __name__ == "__main__":
    main()
