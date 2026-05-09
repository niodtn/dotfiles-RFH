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
      inputs.nixos-wsl.nixosModules.default
      (self.paths.profiles "nixos")

      # Host Specific
      ({
        config,
        pkgs,
        ...
      }: {
        # Nix
        system.stateVersion = stateVersion;
        inherit hostName;

        userName = "nixos";
        wsl.defaultUser = config.userName;

        wsl.enable = true;
        wsl.wslConf.boot.systemd = true;
        environment.systemPackages = [pkgs.wslu];

        # Home Manager
        home-manager.users.${config.userName} = {
          programs.bash = {
            enable = true;
            enableCompletion = true;

            # For atuin with Visual Studio Code - Remote SSH
            initExtra = ''
              export XDG_RUNTIME_DIR="/run/user/$(id -u)"
            '';
          };

          home = {
            stateVersion = stateVersion;
            shell.enableBashIntegration = true;
          };
        };
      })
    ];
  };
}
