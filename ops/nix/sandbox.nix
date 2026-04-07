{ lib, config, ... }:
let cfg = config.pinpkgs.headscale; in {
  config = lib.mkIf cfg.enable {
    systemd.services.headscale.serviceConfig = {
      NoNewPrivileges      = true;
      PrivateTmp           = true;
      ProtectSystem        = "strict";
      ProtectHome          = true;
      ReadWritePaths       = [ cfg.storage.stateDir ];
      CapabilityBoundingSet = "";
      AmbientCapabilities  = "";
    };
  };
}
