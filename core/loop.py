import logging

import discord
from discord import app_commands
from discord.ext import commands, tasks

from core.lib.channel import channel


@app_commands.guild_only()
class LoopHandler(commands.Cog):
    def __init__(self, bot: commands.Bot):
        self.bot = bot
        self.validate_loop.start()

    @tasks.loop(seconds=10)
    async def validate_loop(self):
        try:
            await channel(self.bot)
        except Exception as e:
            logging.error(e)

        """
        try:
            await roles(self.bot)
        ...
        """

    @validate_loop.before_loop
    async def wait_for_ready(self):
        await self.bot.wait_until_ready()

    def cog_unload(self):
        logging.debug("Unloading cog")
        self.validate_loop.stop()

    @app_commands.command()
    async def add(self, inter: discord.Interaction, channel: discord.TextChannel, role: discord.Role):
        ...


async def setup(bot: commands.Bot):
    await bot.add_cog(LoopHandler(bot))
