{
  inputs,
  config,
  pkgs,
  ...
}: let
  marketplace = inputs.vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace;
in {
  home-manager.users.${config.userName}.programs.vscode.profiles.default = {
    extensions = [
      marketplace.ms-python.python
      pkgs.vscode-extensions.ms-python.vscode-pylance
      marketplace.charliermarsh.ruff
    ];

    userSettings = {
      "[python]" = {
        "editor.codeActionsOnSave" = {
          "source.organizeImports" = "explicit";
          "source.fixAll" = "explicit";
        };
        "editor.defaultFormatter" = "charliermarsh.ruff";
      };
    };
  };
}
