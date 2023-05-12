import os
from dotenv import load_dotenv

load_dotenv() # solves the missing getenv problem for local development

def main():
    print(os.getenv("DISCORD_TOKEN"))

if __name__ == "__main__":
    main()
