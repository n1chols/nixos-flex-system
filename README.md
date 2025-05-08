```nix
{
  inputs = {
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-24.11.url = "github:NixOS/nixpkgs/nixos-24.11";
    nixpkgs-23.05.url = "github:NixOS/nixpkgs/nixos-23.05";
  };

  outputs = { self, nixpkgs-unstable, nixpkgs-24.11, nixpkgs-23.05 }: {
    nixosConfigurations = {
      workstation = nixpkgs-unstable.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ... ];
      };
      htpc = nixpkgs-24.11.lib.nixosSystem {
        system = "aarch64-linux";
        modules = [ ... ];
      };
      macbook = nixpkgs-23.05.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [ ... ];
      };
    };
  };
}
```

|
v

```nix
{
  inputs = {
    flex-system.url = "github:n1chols/nixos-flex-system";
  };

  outputs = { self, flex-system }: {
    nixosConfigurations = {
      workstation = flex-system {
        arch = "x86_64";
        version = "unstable";
        modules = [ ... ];
      };
      htpc = flex-system {
        arch = "aarch64";
        version = "24.11";
        modules = [ ... ];
      };
      macbook = flex-system {
        arch = "aarch64";
        platform = "darwin";
        version = "23.05";
        modules = [ ... ];
      };
    };
  };
}
```
