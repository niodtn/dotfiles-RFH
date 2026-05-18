{
  inputs,
  self,
  pkgs,
  config,
  ...
}: {
  imports = [
    (self.paths.modules "common")
    (self.paths.profiles "common/tailscale.nix")
  ];

  # Nix
  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "ca-derivations"
        "fetch-closure"
      ];
      # gc
      auto-optimise-store = true;
      # caches
      extra-substituters = self.caches.substituters;
      extra-trusted-public-keys = self.caches.trustedPublicKeys;
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [inputs.nur.overlays.default];
  };

  environment = {
    systemPackages = [
      pkgs.github-cli
      pkgs.uv # Python Version Manager
    ];

    shellAliases = {
      ll = "ls -al";
      ".." = "cd ../";
      "..." = "cd ../../";

      cloc = "nix run nixpkgs#cloc --";
    };

    enableAllTerminfo = true;
  };

  # Home Manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
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

        starship = {
          enable = true;
          settings = {
            add_newline = false;
            character.format = "❯ ";

            line_break.disabled = true;
            git_status.disabled = true;
            package.disabled = true;
            python.disabled = true;
          };
        };
      };
    };
  };
}
