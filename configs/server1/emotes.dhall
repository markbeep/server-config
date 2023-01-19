let types = ../typings.dhall

in    [ { name = "kekw", path = "media/emotes/kekw.jpg", animated = False }
      , { name = "lul", path = "media/emotes/lul.png", animated = False }
      ]
    : List types.Emote
