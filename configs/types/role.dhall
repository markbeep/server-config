{ Type =
    { name : Text
      , color : Text
      , permissions : Optional Natural
      , position : Optional Natural
    }
  , default =
    { permissions = None Natural
    , position = None Natural
    }
}
