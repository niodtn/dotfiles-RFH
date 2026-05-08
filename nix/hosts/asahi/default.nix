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
      (self.paths.profiles "common/zsh.nix")

      # Hardware
      (self.paths.profiles "nixos/bluetooth.nix")
      (self.paths.profiles "nixos/networking.nix")

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
