"""
Does additional checks to make sure the config is correct before actually running it.
This includes checking if all the given icons actually exist and are pathed correctly.
"""

import dhall
from typing import Tuple
import os

def validate_server(server: dict) -> Tuple[bool, str]:
    icon = server.get("icon", None)
    if icon and not os.path.isfile(icon):
        return False, f"server icon at '{icon}' does not exist"
    banner = server.get("banner", None)
    if banner and not os.path.isfile(banner):
        return False, f"server banner at '{banner}' does not exist"
    
    for ch in server["extraChannels"]:
        valid, error = validate_channel(ch)
        if not valid:
            return False, error
    
    
    return True, None


def validate_channel(channel: dict) -> Tuple[bool, str]:
    
    return True, None


def main():
    with open("configs/servers.dhall", "r") as f:
        config = dhall.load(f)
    print(config)
    
    for server in config:
        valid, error = validate_server(server)
        if not valid:
            print(f"Server config invalid: {server['name']} | {error}")

if __name__ == "__main__":
    main()

    