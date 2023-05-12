let Channel = ./channel.dhall
let Category = ./category.dhall
let Role = ./role.dhall
let Emote = ./emote.dhall
let Sticker = ./sticker.dhall

in { Type =
      { name : Text
        , icon : Optional Text
        , banner : Optional Text
        , categories : List Category.Type
        , extraChannels : List Channel.Type
        , emotes : List Emote.Type
        , roles : List Role.Type
        , stickers : List Sticker.Type
      }
    , default =
      { icon = None Text
      , banner = None Text
      , categories = [] : List Category.Type
      , extraChannels = [] : List Channel.Type
      , emotes = [] : List Emote.Type
      , roles = [] : List Role.Type
      , stickers = [] : List Sticker.Type
      }
}
