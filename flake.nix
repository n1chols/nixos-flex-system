{
  inputs = {
    "unstable".url = "github:NixOS/nixpkgs/nixos-unstable";
    "24.11".url = "github:NixOS/nixpkgs/nixos-24.11";
    "24.05".url = "github:NixOS/nixpkgs/nixos-24.05";
  };
  
  outputs = { self, inputs }: {
    __functor = self: {
      arch ? "x86_64",
      version ? "unstable",
      modules ? []
    }: let
      system = "${arch}-linux";
      nixpkgs = import inputs.${version} { inherit system; };
      lib = nixpkgs.lib;
    in lib.nixosSystem {
      inherit system;
      inherit modules;
      specialArgs = { inherit lib; };
    };
  };
}
