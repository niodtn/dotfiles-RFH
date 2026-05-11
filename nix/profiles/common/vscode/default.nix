{config, ...}: {
  imports = [./base];

  home-manager.users.${config.userName}.programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
  };
}
