{ lib, config, ... }:
let cfg = config.pinpkgs.headscale; in {
  options.pinpkgs.headscale.ports = {
    http    = lib.mkOption { type = lib.types.port; default = 8080;  description = "HTTP listen port."; };
    grpc    = lib.mkOption { type = lib.types.port; default = 50443; description = "gRPC listen port."; };
    metrics = lib.mkOption { type = lib.types.port; default = 9090;  description = "Prometheus metrics port."; };
    stun    = lib.mkOption { type = lib.types.port; default = 3478;  description = "STUN/DERP port."; };
  };
}
