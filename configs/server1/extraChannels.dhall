let types = ../typings.dhall

in    [ { name = "spam"
        , description = Some "Bot spam and such"
        , position = Some 10
        , permissions = None Natural
        }
      ]
    : List types.Channel
