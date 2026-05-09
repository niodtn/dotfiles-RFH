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
      # Core
      (self.paths.profiles "darwin")
      ./system.nix
      ./macbook.nix

      # Applications - CLI
      (self.paths.profiles "common/zsh.nix")

      # Applications - GUI
      ./hammerspoon.nix
      # ./safari.nix

      # Host Specific
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
