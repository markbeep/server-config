let types = ../typings.dhall

in    { name = "Server1"
      , categories = [] : List types.Category
      , extraChannels = [] : List types.Channel
      , emotes = [] : List types.Emote
      , roles = [] : List types.Role
      , stickers = [] : List types.Sticker
      }
    : types.Server
