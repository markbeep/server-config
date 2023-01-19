let types = ../typings.dhall

in    [ { name = "cat hug"
        , path = "media/cathug.png"
        , relatedEmoji = ":grinning:"
        , description = Some "Cat hugging"
        }
      ]
    : List types.Sticker
