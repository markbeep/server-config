{ config, lib, pkgs, ... }:
with lib;
{
  options.server.name = mkOption {
    default = "kek";
    type = types.str;
  };
}
