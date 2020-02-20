{ src ? { outPath = ./.; revCount = 1234; shortRev = "abcdef"; }
, nixpkgs ? builtins.fetchTarball https://github.com/NixOS/nixpkgs-channels/archive/nixos-unstable.tar.gz
, officialRelease ? false
}:

let
  pkgs = import nixpkgs { system = builtins.currentSystem or "x86_64-linux"; };

  jobs = rec {
    build.x86_64-linux = pkgs.releaseTools.nixBuild (
      (pkgs.callPackage (import ./default.nix) { })
        .drvAttrs // {
          inherit src;
          postHook = ''
            src=$origSrc
          '';
        }
    );
  };

in jobs
