{
  inputs,
  self,
  pkgs,
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
      (self.paths.profiles "nixos/boot.nix")
      (self.paths.profiles "nixos/networking.nix")
      ./hardware.nix

      # Applications - CLI
      (self.paths.profiles "nixos/tty/autologin.nix")
      (self.paths.profiles "common/zsh.nix")

      # Host Specific
      ({config, ...}: {
        # Nix
        platform = system;
        system.stateVersion = stateVersion;
        inherit hostName;

        environment = {
          variables = {
            GS_GL_RENDERER = "gl";
            WLR_NO_HARDWARE_CURSORS = "1"; # for cursor bug
          };
          systemPackages = [pkgs.virglrenderer];
        };

        services = {
          spice-vdagentd.enable = true;
          qemuGuest.enable = true;
        };

        hardware.graphics.extraPackages = [pkgs.mesa];
        powerManagement.cpuFreqGovernor = "performance";

        networking.hostName = "utm";

        # Home Manager
        home-manager.users.${config.userName}.home.stateVersion = stateVersion;
      })
    ];
  };
}
