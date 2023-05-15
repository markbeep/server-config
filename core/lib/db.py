"""
Manages the local SQlite database to keep track of what has been copied and
maps configs to Discord servers
"""

import os

from peewee import BitField, IntegerField, Model, SqliteDatabase, TextField

DB_PATH = os.getenv("DB_PATH", "./data")

db = SqliteDatabase(DB_PATH)


class BaseModel(Model):
    class Meta:
        database = db


class Config(BaseModel):
    """
    Contains mappings from Discord guilds to the path of which server
    config to use
    """
    guild_id = IntegerField()
    path = TextField()
    flags = BitField()
    # if config is stored locally
    is_local = flags.flag(1)
    # if an entry is from a server the bot isn't on anymore
    is_invalid_guild = flags.flag(2)
    # if an entry has an invalid path defined
    is_invalid_path = flags.flag(4)
