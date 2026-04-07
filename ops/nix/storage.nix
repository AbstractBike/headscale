{ lib, config, ... }:
let cfg = config.pinpkgs.headscale; in {
  options.pinpkgs.headscale.storage = {
    stateDir = lib.mkOption {
      type    = lib.types.str;
      default = "/var/lib/headscale";
      description = "Directory for headscale state (sqlite db, keys).";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.tmpfiles.rules = [
      "d ${cfg.storage.stateDir} 0750 ${cfg.user} ${cfg.group} -"
    ];
  };
}
