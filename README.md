# Developing
The project with the validate script is built using [Poetry](https://python-poetry.org/).

This allows for correctly versioned and reproducible builds. Additional it allows for simple
local developement if Poetry is installed locally.

# Validating Paths
[Dhall](https://dhall-lang.org/) makes sure that the config follows the correct type structure.
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

**Note:** You might notice there is actually a python Dhall library, but it doesn't get used here.
That is because of two reasons:
1. Dhall is a pain to install on non-linux devices for some reason.
2. The Discord bot will be linked to a file online. When linking a raw Dhall file from
Github the Dhall parser won't be able to correctly parse the whole config anymore. So it
makes more sense to simply link to a full JSON file built by Dhall.

---

# Brainstorming & Theorycrafting
*Rough theory crafting of new problems and ideas that come up where I'm still indecisive
about the exact implementation.*

## Theoretical Workflow
### Setting Up The Config
1. You add the Discord Bot [non-existent] to your Discord server
2. You write the config in [Dhall](https://dhall-lang.org/) to ensure type correctness and make sure
all the required values are set.
3. You convert the config into a JSON format and run the validator over it to make sure paths and IDs
are also set correctly. The validator should ensure that the file is fully set to be deployed.
4. Finally you publish the file somewhere (like on Github) and link up the Discord Bot to the JSON file.
5. The bot would now periodically check for changes and enforce them or notify on inconsistencies.

### Editing The Config (Adding a channel)
1. To add an uncategorized channel you would simply add it in `extraChannels` with a unique ID and
the name of the channel. Depending on if the channel exists or what the given ID is, different actions
would be taken:
  - If config ID is equal to an already existing channel ID (**linked ID**): The bot will make sure the
  other properties (name, description, ...) match on the server.
  - If config ID is a unique ID (**unlinked ID**): The bot will first check if there's an unlinked channel
  with the same name. If there is, the bot will store a mapping of the config ID to the Discord Channel ID.
  If there's isn't yet a channel with the given name, the bot will create the channel with the given
  properties and store the mapping.
2. Then when you want to change the name of a linked channel, you can simply edit the name in the config
and because of the mapping the bot will then know what channel to change the name of. To avoid accidental
problems, the config ID should be changed to the exact Discord channel ID when the intention is to edit a
property.
3. To then delete a channel you would simply take out the channel config. The bot can then check and see that
the specific config was deleted and delete the channel on Discord. *Currently my thought is that this can lead
to accidental deletions, so two ideas would be to (1) not delete channels at all and simply inform users on
the Discord Server or (2) archive the channels by removing all permissions, renaming it and potentially moving it
into an archived category.*

## IDs & Duplicate Names
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

## Modularity
A cool addition would be if the whole program was modular. Meaning it would be fairly
easy to add new features as quick mods. For example a mod that adds a cron-like action that sends
messages in a specifc channel in a timed manner. For that to work well an optional `flag` attribute
in each object would be necessary.
