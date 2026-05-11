{config, ...}: {
  imports = [
    ./user-chrome.nix
  ];

  home-manager.users.${config.userName}.programs.firefox = {
    enable = true;

    policies = {
      DisableAppUpdate = true;
      DisableFirefoxAccounts = true;

      Preferences = {
        "browser.aboutConfig.showWarning" = {
          Value = false;
          Status = "locked";
        };
      };
    };

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
    };
  };
}
