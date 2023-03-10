let types = ../typings.dhall

in    { name = "Server1"
      , icon = None Text
      , banner = None Text
      , categories = ./categories/categories.dhall : List types.Category.Type
      , extraChannels = ./extraChannels.dhall : List types.Channel.Type
      , emotes = ./emotes.dhall : List types.Emote
      , roles = ./roles.dhall : List types.Role
      , stickers = ./stickers.dhall : List types.Sticker
      }
    : types.Server
