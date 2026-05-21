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

      # System
      ./hardware
      (self.paths.profiles "nixos/boot.nix")
      (self.paths.profiles "nixos/plymouth.nix")

      (self.paths.profiles "nixos/bluetooth.nix")
      (self.paths.profiles "nixos/networking.nix")
      (self.paths.profiles "nixos/sound.nix")

      # Applications - CLI
      (self.paths.profiles "nixos/tty/autologin.nix")
      (self.paths.profiles "nixos/tty/kmscon.nix")
      (self.paths.profiles "common/zsh.nix")
      (self.paths.profiles "common/zellij.nix")

      # # Applications - GUI
      # (self.paths.profiles "common/vscode")
      # (self.paths.profiles "common/ghostty.nix")
      # (self.paths.profiles "common/vesktop.nix")

      # Host Specific
      ({config, ...}: {
        # Nix
        platform = system;
        system.stateVersion = stateVersion;
        inherit hostName;

        # For Windows dual-boot
        time.hardwareClockInLocalTime = true;

        # Home Manager
        home-manager.users.${config.userName}.home.stateVersion = stateVersion;
      })
    ];
  };
}
