FROM nixos/nix:2.13.1

WORKDIR /app

# creates the file, copies it over and renames it
COPY default.nix .
COPY configs configs
CMD nix-build && cp `readlink result` build/config.json
