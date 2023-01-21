let Channel = ./channel.dhall

in  { Type =
        { name : Text
        , id : Natural
        , position : Optional Natural
        , permissions : Optional Natural
        , channels : List Channel.Type
        }
    , default =
      { position = None Natural
      , permissions = None Natural
      , channels = [] : List Channel.Type
      }
    }
