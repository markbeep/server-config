let types = ../typings.dhall

in    [ { mapKey = "Admin"
        , mapValue =
          { color = "#121212", permissions = None Natural, position = Some 0 }
        }
      , { mapKey = "Bot"
        , mapValue =
          { color = "#121212"
          , permissions = None Natural
          , position = None Natural
          }
        }
      , { mapKey = "Teaching Assistant"
        , mapValue =
          { color = "#121212"
          , permissions = None Natural
          , position = None Natural
          }
        }
      ]
    : List types.Role
