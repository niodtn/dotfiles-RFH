{
  config,
  pkgs,
  ...
}: {
  home-manager.users.${config.userName}.programs.vscode.profiles.default = {
    extensions = with pkgs.vscode-extensions; [
      github.copilot
      github.copilot-chat
    ];

    userSettings = {
      "github.copilot.nextEditSuggestions.enabled" = false;
    };
  };
}
