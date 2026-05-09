{config, ...}: {
  home-manager.users.${config.userName}.programs.vscode.profiles.default = {
    userSettings = {
      "workbench.statusBar.visible" = false;

      # Title Bar
      "window.titleBarStyle" = "native";
      "window.customTitleBarVisibility" = "never";

      # Menu Bar
      "window.menuBarVisibility" = "hidden";
    };
  };
}
