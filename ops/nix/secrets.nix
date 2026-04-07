{ lib, config, ... }:
let cfg = config.pinpkgs.headscale; in {
  options.pinpkgs.headscale.secrets = {
    privateKeyFile = lib.mkOption {
      type        = lib.types.nullOr lib.types.path;
      default     = null;
      description = "Path to headscale private key file (managed by agenix/sops).";
    };
    noisePrivateKeyFile = lib.mkOption {
      type        = lib.types.nullOr lib.types.path;
      default     = null;
      description = "Path to Noise protocol private key file.";
    };
  };
}
