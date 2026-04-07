# NixOS module entry point for headscale.
{ lib, config, pkgs, ... }:
let cfg = config.pinpkgs.headscale; in {
  imports = [
    ./ports.nix
    ./users.nix
    ./secrets.nix
    ./storage.nix
    ./health.nix
    ./sandbox.nix
    # add as needed:
    # ./env.nix ./resources.nix ./network.nix
    # ./certs.nix ./metrics.nix ./logs.nix ./traces.nix
    # ./backup.nix ./alerts.nix ./dashboard.nix
  ];

  options.pinpkgs.headscale = {
    enable  = lib.mkEnableOption "headscale AbstractBike fork";
    package = lib.mkOption {
      type        = lib.types.package;
      default     = pkgs.headscale;
      description = "The headscale package to use.";
    };
    configFile = lib.mkOption {
      type        = lib.types.path;
      description = "Path to headscale config.yaml.";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.headscale = {
      description = "headscale - Tailscale control server";
      wantedBy    = [ "multi-user.target" ];
      after       = [ "network-online.target" ];
      wants       = [ "network-online.target" ];
      serviceConfig = {
        User            = cfg.user;
        Group           = cfg.group;
        ExecStart       = "${cfg.package}/bin/headscale serve --config ${cfg.configFile}";
        Restart         = "on-failure";
        RestartSec      = "5s";
        WorkingDirectory = cfg.storage.stateDir;
      };
    };
  };
}
