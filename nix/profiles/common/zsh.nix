{
  options,
  lib,
  config,
  pkgs,
  ...
}: let
  isDarwin = options ? homebrew;
in {
  config = lib.mkMerge [
    # Common
    {
      programs.zsh.enable = true;
      users.users.${config.userName}.shell = pkgs.zsh;

      # Home Manager
      home-manager.users.${config.userName} = {
        programs.zsh = {
          enable = true;
          enableCompletion = true;
          autosuggestion.enable = true;
          syntaxHighlighting.enable = true;
        };
      };
    }

    # Darwin
    (lib.optionalAttrs isDarwin {
      homebrew.enableZshIntegration = true;
    })
  ];
}
