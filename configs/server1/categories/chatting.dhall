{- to avoid reusing the same unlinked IDs it can be helpful to
set category IDs by increments of 100s and setting the channel IDs
to the same hundred range -}
let types = ../../typings.dhall

in    types.Category::{
      , name = "Chatting"
      , id = 100
      , channels =
            [ types.Channel::{
              , name = "General"
              , id = 101
              , description = Some "General chatting channel"
              }
            , types.Channel::{
              , name = "Off-Topic"
              , id = 102
              , description = Some "Off topic stuff should go here"
              }
            ]
          : List types.Channel.Type
      }
    : types.Category.Type
