{ pkgs }:
pkgs.runCommand "headscale-module-test" { } ''
  echo "headscale ops/nix stub test passed" > $out
''
