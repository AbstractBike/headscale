{ lib, config, ... }:
let cfg = config.pinpkgs.headscale; in {
  options.pinpkgs.headscale.health = {
    checkInterval = lib.mkOption {
      type    = lib.types.str;
      default = "30s";
      description = "Systemd watchdog interval for headscale.";
    };
  };
}
