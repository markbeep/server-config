let types = ../typings.dhall

in    [ { name = "dead"
        , path = "media/stickers/dead.png"
        , relatedEmoji = ":skull:"
        , description = Some "Skull"
        }
      ]
    : List types.Sticker
