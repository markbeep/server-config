let types = ../typings.dhall

in    [ types.Channel::{
        , name = "spam"
        , description = Some "Bot spam and such"
        , position = Some 10
        }
      ]
    : List types.Channel.Type
