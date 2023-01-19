let types = ../../typings.dhall

in    { mapKey = "Chatting"
      , mapValue =
        { permissions = None Natural
        , channels =
              [ { name = "General"
                , description = Some "General chatting channel"
                , permissions = None Natural
                , position = None Natural
                }
              , { name = "Off-Topic"
                , description = Some "Off topic stuff should go here"
                , permissions = None Natural
                , position = None Natural
                }
              ]
            : List types.Channel
        , position = None Natural
        }
      }
    : types.Category
