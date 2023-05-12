let types = ../typings.dhall

in    [ types.Role::{ name = "Admin"
        , color = "#121212"
        , permissions = None Natural
        , position = Some 0
        }
      , types.Role::{ name = "Bot"
        , color = "#121212"
        , permissions = None Natural
        , position = None Natural
        }
      , types.Role::{ name = "Teaching Assistant"
        , color = "#121212"
        , permissions = None Natural
        , position = None Natural
        }
      ]
    : List types.Role.Type
