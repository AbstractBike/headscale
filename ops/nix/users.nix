{ lib, config, ... }:
let cfg = config.pinpkgs.headscale; in {
  options.pinpkgs.headscale = {
    user  = lib.mkOption { type = lib.types.str; default = "headscale"; description = "User to run headscale as."; };
    group = lib.mkOption { type = lib.types.str; default = "headscale"; description = "Group to run headscale as."; };
  };

  config = lib.mkIf cfg.enable {
    users.users.headscale = {
      isSystemUser = true;
      group        = cfg.group;
      description  = "headscale daemon user";
    };
    users.groups.headscale = { };
  };
}
