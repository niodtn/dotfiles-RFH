{
  inputs,
  pkgs,
  options,
  lib,
  ...
}: let
  marketplace = inputs.vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace;
  isDarwin = options ? homebrew;
in {
  config = lib.mkMerge [
    {
      home-manager.users.${config.userName}.programs.vscode.profiles.default = {
        extensions = with marketplace; [
          mkhl.direnv
          joshx.workspace-terminals
        ];

        userSettings = {
          "direnv.restart.automatic" = true;
        };
      };
    }

    (lib.optionalAttrs isDarwin {
      home-manager.users.${config.userName}.programs.vscode.profiles.default = {
        userSettings = {
          "terminal.integrated.env.osx" = {
            "DIRENV_LOG_FORMAT" = "-";
          };
        };
      };
    })
  ];
}
