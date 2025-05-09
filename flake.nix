{
  outputs = { self, nixpkgs }: {
    __functor = self: {
      arch ? "x86_64",
      modules ? []
    }: let
      system = "${arch}-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      lib = nixpkgs.lib;
    in lib.nixosSystem {
      inherit system;
      inherit modules;
      specialArgs = { inherit pkgs; inherit lib; };
    };
  };
}
