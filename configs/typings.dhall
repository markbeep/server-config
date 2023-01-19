let Channel
    : Type
    = { name : Text
      , description : Optional Text
      , position : Optional Natural
      , permissions : Optional Natural
      }

let Category
    : Type
    = { name : Text
      , position : Optional Natural
      , permissions : Optional Natural
      , channels : List Channel
      }

let Role
    : Type
    = { name : Text, color : Text, permissions : Optional Natural }

let Emote
    : Type
    = { name : Text, path : Text }

let Sticker
    : Type
    = { name : Text, description : Optional Text, emote : Text, path : Text }

let Server
    : Type
    = { name : Text
      , categories : List Category
      , extraChannels : List Channel
      , emotes : List Emote
      , roles : List Role
      , stickers : List Sticker
      }

in  { Server, Category, Channel, Role, Emote, Sticker }
