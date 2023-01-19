-- Defines the channel type.
{ Type =
    {-
    position: Position to place channel. 0 being the top.
    slowmode: one of ["off", "5s"-"30s", "1m"-"30m", "1h"-"6h"]
    hide-after-inactivity: one of ["1h", "24h", "3d", "1w"]
    -}
    { name : Text
    , description : Optional Text
    , position : Optional Natural
    , slowmode : Optional Text
    , age-restricted : Optional Bool
    , announcement : Optional Bool
    , hide-after-inactivity : Optional Text
    , permissions : Optional Natural
    }
, default =
  { description = None Text
  , position = None Natural
  , slowmode = None Text
  , age-restricted = None Bool
  , announcement = None Bool
  , hide-after-inactivity = None Text
  , permissions = None Natural
  }
}
