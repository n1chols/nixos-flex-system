{
  outputs = { self }: {
    __functor = {
      arch ? "x86_64",
      platform ? "linux",
      version ? "unstable",
      modules ? []
    }: let
      system = "${arch}-${platform}";
      nixpkgs = import (fetchTarball {
        url = "https://github.com/NixOS/nixpkgs/archive/nixos-${version}.tar.gz";
      }) { inherit system; };
      lib = nixpkgs.lib;
    in lib.nixosSystem {
      inherit system;
      inherit modules;
      specialArgs = { inherit lib; };
    };
  };
}
