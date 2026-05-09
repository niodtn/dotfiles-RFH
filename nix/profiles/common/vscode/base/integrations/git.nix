{config, ...}: {
  home-manager.users.${config.userName}.programs.vscode.profiles.default.userSettings = {
    "git.autofetch" = true;
    "git.confirmSync" = false;
    "git.suggestSmartCommit" = true;
    "git.mergeEditor" = true;
    "git.inputValidation" = true;

    "git.allowForcePush" = true;
    "git.confirmForcePush" = false;
  };
}
