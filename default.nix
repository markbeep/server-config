{ lib }:
with builtins; with import <nixpkgs> { };
let
  server1 = import ./configs;
  config = toJSON server1;
  lib.mkOption = { };
in
writeTextFile {
  name = "config.json";
  text = config;
}

