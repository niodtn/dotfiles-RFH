{
  inputs,
  self,
  ...
}: let
  system = "x86_64-linux";
  stateVersion = "26.05";
  hostName = builtins.baseNameOf ./.;
in {
  flake.nixosConfigurations.${hostName} = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs = {inherit inputs self;};

    modules = [
      # Core
      (self.paths.profiles "nixos")
      ./cachy-kernel.nix

      # System
      (self.paths.profiles "nixos/boot.nix")
      # (self.paths.profiles "nixos/plymouth.nix")
      ./hardware
      ./windows.nix

      (self.paths.profiles "nixos/networking.nix")
      (self.paths.profiles "nixos/sound.nix")

      # Applications - CLI
      # (self.paths.profiles "nixos/tty/autologin.nix")
      (self.paths.profiles "nixos/tty/kmscon.nix")

      # # Applications - GUI
      # (self.paths.profiles "nixos/gui/gnome.nix")

      # (self.paths.profiles "common/vscode")
      # (self.paths.profiles "common/ghostty.nix")
      # (self.paths.profiles "common/firefox")
      # (self.paths.profiles "common/vesktop.nix")

      # Host Specific
      ({config, ...}: {
        # Nix
        platform = system;
        system.stateVersion = stateVersion;
        inherit hostName;

        # Home Manager
        home-manager.users.${config.userName}.home.stateVersion = stateVersion;
      })
    ];
  };
}
