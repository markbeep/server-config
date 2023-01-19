{- Basically types defined here are still TODO and should be moved
to their own file for more clarity -}
let Channel = ./types/channel.dhall

let Category
    : Type
    = { name : Text
      , position : Optional Natural
      , permissions : Optional Natural
      , channels : List Channel.Type
      }

let Role
    : Type
    = { name : Text
      , color : Text
      , permissions : Optional Natural
      , position : Optional Natural
      }

let Emote
    : Type
    = { name : Text, path : Text, animated : Bool }

let Sticker
    : Type
    = { name : Text
      , description : Optional Text
      , relatedEmoji : Text
      , path : Text
      }

let Server
    : Type
    = { name : Text
      , icon : Optional Text
      , banner : Optional Text
      , categories : List Category
      , extraChannels : List Channel.Type
      , emotes : List Emote
      , roles : List Role
      , stickers : List Sticker
      }

in  { Server, Category, Channel, Role, Emote, Sticker }
