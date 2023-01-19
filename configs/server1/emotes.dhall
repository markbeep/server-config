let types = ../typings.dhall

in    [ { mapKey = "kekw"
        , mapValue = { path = "media/emotes/kekw.jpg", animated = False }
        }
      , { mapKey = "lul"
        , mapValue = { path = "media/emotes/lul.jpg", animated = False }
        }
      ]
    : List types.Emote
