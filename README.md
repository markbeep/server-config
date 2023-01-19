# Building the new JSON config from Nix
If you have `nix-build` on your system, simply execute:
```bash
nix-build && cp `readlink result` build/config.json
```

Else if you don't have Nix, you can also build the config with
Docker by either running it with this command:
```bash
docker run -v $PWD/build:/app/build --rm $(docker build -q .)
```

Or if that doesn't work, there's also a docker-compose file so you could also just run:
```bash
docker compose up --build
```

# Developing
The Python project
