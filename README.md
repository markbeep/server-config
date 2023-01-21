# Developing
The project with the validate script is built using [Poetry](https://python-poetry.org/).

This allows for correctly versioned and reproducible builds. Additional it allows for simple
local developement if Poetry is installed locally.

# Validating Paths
Dhall already makes sure that the config follows the correct type structure.
It can not validate external features like image paths though. For this
reason the `validate.py` script should **always** be ran before pushing to
make sure all linked emotes and images exist and are of the correct path.

**Note:** The dhall python package is currently not downloadable on Windows for reasons
I'm not able to currently figure out.

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

# Theorycrafting
*Rough theory crafting of new problems and ideas that come up where I'm still indecisive
about the exact implementation:*

One of the major requisites is that a server-config has to be applicable on already
existing channels, roles, etc. while also being able to create new objects if defined.

The issues that follow with this, is that Discord allows for duplicate names, so names
are not a unique element in objects (there can even be multiple of the same name in the
same category).

One way to approach this issue is to enforce an ID in each element. For existing channels
the ID should be an already existing Discord ID, but for new elements the ID has to be some
arbritrary ID chosen to uniquely identify the new object and in a runtime database the
unique ID will then be linked to the Discord ID.

The ID is not only important for managing duplicate names, but also ensuring the correct
channel or role is renamed when changing the name in the config.

Additionally to ensure consistency, the ID of an element should be updated to the Discord ID
to ensure consistency even when the database is lost.
