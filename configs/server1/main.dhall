let types = ../typings.dhall

in types.Server::{ name = "Server1"
      , icon = None Text
      , banner = None Text
      , categories = ./categories/categories.dhall : List types.Category.Type
      , extraChannels = ./extraChannels.dhall : List types.Channel.Type
      , emotes = ./emotes.dhall : List types.Emote.Type
      , roles = ./roles.dhall : List types.Role.Type
      , stickers = ./stickers.dhall : List types.Sticker.Type
      }
