{
  config,
  marketplace,
  pkgs,
  ...
}: {
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
