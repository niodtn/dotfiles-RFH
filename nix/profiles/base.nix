{
  self,
  pkgs,
  config,
  ...
}: {
  imports = [
    (self.paths.modules "common")
  ];

  # Nix
  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    settings = {
      experimental-features = "nix-command flakes";
      # gc
      auto-optimise-store = true;
      # caches
      extra-substituters = self.caches.substituters;
      extra-trusted-public-keys = self.caches.trustedPublicKeys;
    };
  };
  nixpkgs.config.allowUnfree = true;

  environment = {
    systemPackages = [
      pkgs.github-cli
    ];

    shellAliases = {
      ll = "ls -l";
      ".." = "cd ../";
      "..." = "cd ../../";
    };
  };

  # Home Manager
  home-manager = {
    backupFileExtension = "backup";
    users.${config.userName} = {
      programs = {
        git = {
          enable = true;
          settings.user.name = "niodtn";
          settings.user.email = "ipete93@gmail.com";
        };

        jujutsu = {
          enable = true;
          settings = {
            user.email = "ipegte93@gmail.com";
            user.name = "niodtn";

            ui.default-commnad = "log";
            revset-aliases."immutable_heads()" = "trunk() | tags()";
          };
        };

        direnv = {
          enable = true;
          silent = true;
          nix-direnv.enable = true;
        };

        atuin = {
          enable = true;
          settings = {
            style = "auto";
            invert = true;
          };
        };
      };
    };
  };
}
