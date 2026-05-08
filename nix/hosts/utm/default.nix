{
  inputs,
  self,
  ...
}: let
  system = "aarch64-linux";
  stateVersion = "26.05";
  hostName = builtins.baseNameOf ./.;
in {
  flake.nixosConfigurations.${hostName} = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {inherit inputs self;};

    modules = [
      (self.paths.profiles "nixos")

      ({config, ...}: {
        # Nix
        system.stateVersion = stateVersion;
        inherit hostName;

        # Home Manager
        home-manager.users.${config.userName}.home.stateVersion = stateVersion;
      })
    ];
  };
}
