{
  outputs = { self, nixpkgs }: {
    __functor = self: {
      arch ? "x86_64",
      modules ? []
    }: let
      system = "${arch}-linux";
      lib = nixpkgs.lib;
    in lib.nixosSystem {
      inherit system;
      inherit modules;
      specialArgs = { inherit lib; };
    };
  };
}
