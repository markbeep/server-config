let types = ../typings.dhall

in    [ types.Sticker::{ name = "dead"
        , path = "media/stickers/dead.png"
        , relatedEmoji = ":skull:"
        , description = Some "Skull"
        }
      ]
    : List types.Sticker.Type
