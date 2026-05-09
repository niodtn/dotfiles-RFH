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
      # Core
      (self.paths.profiles "nixos")

      # System
      (self.paths.profiles "nixos/networking.nix")

      # Applications - CLI
      (self.paths.profiles "common/zsh.nix")

      # Host Specific
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
