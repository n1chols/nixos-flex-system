{
  inputs = {
    "unstable".url = "github:NixOS/nixpkgs/nixos-unstable";
    "unstable-small".url = "github:NixOS/nixpkgs/nixos-unstable-small";
    "24.11".url = "github:NixOS/nixpkgs/nixos-24.11";
    "24.11-small".url = "github:NixOS/nixpkgs/nixos-24.11-small";
    "24.05".url = "github:NixOS/nixpkgs/nixos-24.05";
    "24.05-small".url = "github:NixOS/nixpkgs/nixos-24.05-small";
    "23.11".url = "github:NixOS/nixpkgs/nixos-23.11";
    "23.11-small".url = "github:NixOS/nixpkgs/nixos-23.11-small";
    "23.05".url = "github:NixOS/nixpkgs/nixos-23.05";
    "23.05-small".url = "github:NixOS/nixpkgs/nixos-23.05-small";
    "22.11".url = "github:NixOS/nixpkgs/nixos-22.11";
    "22.11-small".url = "github:NixOS/nixpkgs/nixos-22.11-small";
    "22.05".url = "github:NixOS/nixpkgs/nixos-22.05";
    "22.05-small".url = "github:NixOS/nixpkgs/nixos-22.05-small";
    "21.11".url = "github:NixOS/nixpkgs/nixos-21.11";
    "21.11-small".url = "github:NixOS/nixpkgs/nixos-21.11-small";
    "21.05".url = "github:NixOS/nixpkgs/nixos-21.05";
    "21.05-small".url = "github:NixOS/nixpkgs/nixos-21.05-small";
    "20.09".url = "github:NixOS/nixpkgs/nixos-20.09";
    "20.09-small".url = "github:NixOS/nixpkgs/nixos-20.09-small";
    "20.03".url = "github:NixOS/nixpkgs/nixos-20.03";
    "20.03-small".url = "github:NixOS/nixpkgs/nixos-20.03-small";
    "19.09".url = "github:NixOS/nixpkgs/nixos-19.09";
    "19.09-small".url = "github:NixOS/nixpkgs/nixos-19.09-small";
    "19.03".url = "github:NixOS/nixpkgs/nixos-19.03";
    "19.03-small".url = "github:NixOS/nixpkgs/nixos-19.03-small";
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
