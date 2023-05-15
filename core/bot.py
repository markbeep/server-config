import logging
import os

import discord
from cogwatch import watch
from discord.ext import commands
from dotenv import load_dotenv

load_dotenv()  # solves the missing getenv problem for local development


class Bot(commands.Bot):
    def __init__(self):
        intents = discord.Intents.none()
        super().__init__(command_prefix=";", intents=intents,
                         description="Lecture Notifier")

    @watch(path="core", preload=True, debug=False)
    async def on_ready(self):
        print(f"Bot started up: {self.user.name} ({self.user.id})")

    async def setup_hook(self):
        await self.load_extension("core.loop")


def main():
    if os.getenv("DEBUG"):
        logging.basicConfig(level=logging.DEBUG)
    else:
        logging.basicConfig(level=logging.WARNING)

    token = os.getenv("DISCORD_TOKEN")
    if token:
        Bot().run(token, log_level=logging.INFO)
    else:
        logging.error("No Discord bot token supplied")
        exit(1)


if __name__ == "__main__":
    main()
