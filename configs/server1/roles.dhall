let types = ../typings.dhall

in    [ { name = "Admin"
        , color = "#121212"
        , permissions = None Natural
        , position = Some 0
        }
      , { name = "Bot"
        , color = "#121212"
        , permissions = None Natural
        , position = None Natural
        }
      , { name = "Teaching Assistant"
        , color = "#121212"
        , permissions = None Natural
        , position = None Natural
        }
      ]
    : List types.Role
