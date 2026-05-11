{config, ...}: {
  home-manager.users.${config.userName}.programs.firefox = {
    enable = true;

    policies = {
      DisableAppUpdate = true;
      DisableFirefoxAccounts = true;
    };

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
    };
  };
}
