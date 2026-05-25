{
  lib,
  config,
  self,
  options,
  ...
}: {
  imports = [
    ./zsh.nix

    ./aliases.nix
    ./vcs.nix
  ];

  config = lib.mkMerge [
    # Both
    {
      home-manager.users.${config.userName}.programs = {
        atuin = {
          enable = true;
          enableZshIntegration = config.programs.zsh.enable;
          settings = {
            style = "auto";
            invert = true;
          };
        };

        direnv = {
          enable = true;
          silent = true;
          nix-direnv.enable = true;
          enableZshIntegration = config.programs.zsh.enable;
        };

        starship = {
          enable = true;
          enableZshIntegration = config.programs.zsh.enable;
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
    }

    # Linux
    (self.isLinux options {
      environment.enableAllTerminfo = true;
    })
  ];
}
