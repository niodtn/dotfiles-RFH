{
  pkgs,
  config,
  ...
}: let
  modifierKey =
    if pkgs.stdenv.isLinux
    then "ctrl"
    else "cmd";
in {
  home-manager.users.${config.userName}.programs.vscode.profiles.default.keybindings = [
    {
      key = "${modifierKey}+b"; # Remove Default
      command = "-workbench.action.toggleSidebarVisibility";
    }
    {
      key = "${modifierKey}+;";
      command = "workbench.action.toggleSidebarVisibility";
    }

    {
      key = "alt+${modifierKey}+b"; # Remove Default
      command = "-workbench.action.toggleAuxiliaryBar";
    }
    {
      key = "${modifierKey}+'";
      command = "workbench.action.toggleAuxiliaryBar";
    }

    {
      key = "shift+${modifierKey}+p"; # Remove Default
      command = "-workbench.action.showCommands";
    }
    {
      key = "${modifierKey}+p";
      command = "workbench.action.showCommands";
    }
  ];
}
