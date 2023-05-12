"""
Does additional checks to make sure the config is correct before actually running it.
This includes checking if all the given icons actually exist and are pathed correctly.

To make it really simple to figure out what exactly is wrong, errors are given in a simple
arrow chain starting at the server name and leading to the error. Elements in square brackets
indicate a field while other values indicate a named attribute.

Current checks:
- Checks image paths to ensure they exist
- Checks for duplicate channel ids
"""

from typing import Tuple
import os
import json

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

    # get a set of all duplicate ids from all channels
    ids = [x["id"] for x in server["extraChannels"]] + [
        x["id"] for cat in server["categories"] for x in cat["channels"]
    ]
    duplicate_ids = set(filter(lambda x: ids.count(x) > 1, ids))

    valid, error = validate_multiple_channels(server["extraChannels"], duplicate_ids)
    if not valid:
        return False, "[extraChannels] > " + error

    # check for duplicate category ids and validate categories
    cat_ids = set()
    for cat in server["categories"]:
        valid, error = validate_category(cat, duplicate_ids)
        if not valid:
            return False, "[categories] > " + error
        if (p := cat["id"]) in cat_ids:
            return False, f"[categories] > duplicate category ID '{p}'"
        cat_ids.add(p)

    ems = set()
    for emote in server["emotes"]:
        if not os.path.isfile(fp := emote["path"]):
            return False, f"[emotes] > emote at '{fp}' does not exist"
        if emote["name"] in ems:
            return False, f"[emotes] > duplicate emote name '{emote['name']}'"
        ems.add(emote["name"])

    stks = set()
    for sticker in server["stickers"]:
        if not os.path.isfile(fp := sticker["path"]):
            return False, f"[stickers] > sticker at '{fp}' does not exist"
        if sticker["name"] in stks:
            return False, f"[stickers] > duplicate sticker name '{sticker['name']}'"
        stks.add(sticker["name"])

    return True, None


def validate_category(category: dict, duplicate_ids: set[int]) -> Tuple[bool, str]:
    valid, error = validate_multiple_channels(category["channels"], duplicate_ids)
    if not valid:
        return False, f"{category['name']} > [channels] > " + error

    # TODO
    return True, None


def validate_channel(channel: dict) -> Tuple[bool, str]:
    # TODO
    return True, None


def validate_multiple_channels(
    channels: list, duplicate_ids: set[int]
) -> Tuple[bool, str]:
    # detect duplicate channel names
    for chan in channels:
        valid, error = validate_channel(chan)
        if not valid:
            return False, error
        if (p := chan["id"]) in duplicate_ids:
            return False, f"duplicate channel id '{p}'"

    return True, None


def validate(fp: str):
    try:
        with open(fp, "r", encoding="utf-8") as f:
            config = json.load(f)
    except FileNotFoundError as exc:
        raise FileNotFoundError(f"'{fp}' was not found. Have you ran 'dhall-to-json'?") from exc

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
    validate("build/config.json")


if __name__ == "__main__":
    main()
