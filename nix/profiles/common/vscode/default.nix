{config, ...}: {
  imports = [./base];

  manager.users.${config.userName}.programs.vscode = {
    enable = true;
    mutableExtensionsDir = false;
  };
}
