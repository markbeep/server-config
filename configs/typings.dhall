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
    = { mapKey : Text
      , mapValue :
          { color : Text
          , permissions : Optional Natural
          , position : Optional Natural
          }
      }

let Emote
    : Type
    = { mapKey : Text, mapValue : { path : Text, animated : Bool } }

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
      , extraChannels : List Channel
      , emotes : List Emote
      , roles : List Role
      , stickers : List Sticker
      }

in  { Server, Category, Channel, Role, Emote, Sticker }
