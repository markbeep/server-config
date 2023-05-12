let types = ../typings.dhall

in    [ types.Emote::{ name = "kekw", path = "media/emotes/kekw.jpg", animated = False }
      , types.Emote::{ name = "lul", path = "media/emotes/lul.png", animated = False }
      ]
    : List types.Emote.Type
