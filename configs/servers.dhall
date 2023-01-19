-- This file puts all server configs together into a list
let types = ./typings.dhall in [ ./server1/main.dhall ] : List types.Server
