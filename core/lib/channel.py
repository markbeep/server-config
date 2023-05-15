import logging

from discord.ext import commands


async def channel(bot: commands.Bot):
    """Checks the channel configuration"""
    logging.info("Checking channel configuration")
