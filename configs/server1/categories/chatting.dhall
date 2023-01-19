let types = ../../typings.dhall

in    { name = "Chatting"
      , permissions = None Natural
      , channels =
            [ types.Channel::{
              , name = "General"
              , description = Some "General chatting channel"
              }
            , types.Channel::{
              , name = "Off-Topic"
              , description = Some "Off topic stuff should go here"
              }
            ]
          : List types.Channel.Type
      , position = None Natural
      }
    : types.Category
