{
  config,
  pkgs,
  ...
}: {
  home-manager.users.${config.userName}.programs.vscode.profiles.default.extensions = [pkgs.vscode-extensions.visualjj.visualjj];
}
