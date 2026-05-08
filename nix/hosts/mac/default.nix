{
  inputs,
  self,
  ...
}: let
  system = "aarch64-darwin";
  stateVersion = "26.05";
  hostName = builtins.baseNameOf ./.;
in {
  flake.darwinConfigurations.${hostName} = inputs.nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = {inherit inputs self;};

    modules = [
      (self.paths.profiles "darwin")
      (self.paths.profiles "common/zsh.nix")
      ./hammerspoon.nix
      # ./safari.nix

      # Hardware
      ./system.nix
      ./macbook.nix

      ({config, ...}: {
        # Nix
        system.stateVersion = 6; # $ darwin-rebuild changelog
        inherit hostName;

        # Home Manager
        home-manager.users.${config.userName}.home.stateVersion = stateVersion;
      })
    ];
  };
}
