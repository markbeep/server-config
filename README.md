# Developing
The project with the validate script is built using [Poetry](https://python-poetry.org/).

This allows for correctly versioned and reproducible builds. Additional it allows for simple
local developement if Poetry is installed locally.

# Validating Paths
Dhall already makes sure that the config follows the correct type structure.
It can not validate external features like image paths though. For this
reason the `validate.py` script should **always** be ran before pushing to
make sure all linked emotes and images exist and are of the correct path.

To run `validate.py` locally you can simply run it using Poetry:
```bash
poetry install
poetry run python validate.py
```

Else if you don't have Poetry, you can also run the validate script
with Docker.
```bash
docker run --rm $(docker build -q .)
```
