# Build derivation for headscale.
# Receives `src` as argument — does not fetch internally.
{
  lib,
  buildGoModule,
  src,
}:
buildGoModule {
  pname = "headscale";
  version = "0-pinpkgs";
  inherit src;

  vendorHash = "sha256-jom1279Lx2Knff93rfoEgGeBBk+EjJO7GAkaQYlchgY=";

  subPackages = [ "cmd/headscale" ];

  checkFlags = [ "-short" ];

  meta = {
    description = "Open source, self-hosted implementation of the Tailscale control server";
    homepage = "https://github.com/juanfont/headscale";
    license = lib.licenses.bsd3;
    mainProgram = "headscale";
  };
}
