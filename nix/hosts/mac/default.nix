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

      # Applications - GUI
      (self.paths.profiles "common/vscode")
      (self.paths.profiles "common/ghostty.nix")
      (self.paths.profiles "common/vesktop.nix")
      (self.paths.profiles "common/zen-browser.nix")
      ./hammerspoon.nix
      # ./safari.nix

      # Host Specific
      ({
        config,
        pkgs,
        ...
      }: {
        # Nix
        platform = system;
        system.stateVersion = 6; # $ darwin-rebuild changelog
        inherit hostName;

        environment = {
          shellAliases = {
            tssh = "tailscale ssh";
          };
          systemPackages = [
            pkgs.rectangle
            pkgs.betterdisplay # License key is in Bitwarden
            self.packages.${system}.finetune
          ];
        };

        homebrew = {
          brews = [
            "syncthing"
          ];

          casks = [
            "obsidian"
            "linearmouse" # Mouse
            "prismlauncher"
            "spotify"

            # Dev
            # "finch"
          ];

          masApps = {
            "Folder Hub" = 6473019059;
            "Amphetamine" = 937984704;
          };
        };

        # Home Manager
        home-manager.users.${config.userName}.home.stateVersion = stateVersion;
      })
    ];
  };
}
