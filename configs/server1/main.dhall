let types = ../typings.dhall

in    { name = "Server1"
      , icon = Some "media/icon.png"
      , banner = Some "media/banner.png"
      , categories = [] : List types.Category
      , extraChannels = ./extraChannels.dhall : List types.Channel
      , emotes = ./emotes.dhall : List types.Emote
      , roles = ./roles.dhall : List types.Role
      , stickers = ./stickers.dhall : List types.Sticker
      }
    : types.Server
