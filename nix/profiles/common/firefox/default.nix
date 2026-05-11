{config, ...}: let
  mkLocked = value: {
    Value = value;
    Status = "locked";
  };
in {
  imports = [
    ./user-chrome.nix
  ];

  _module.args = {
    inherit mkLocked;
  };

  home-manager.users.${config.userName}.programs.firefox = {
    enable = true;

    policies = {
      DisableAppUpdate = true;
      DisableFirefoxAccounts = true;

      Preferences = {
        "browser.aboutConfig.showWarning" = mkLocked false;
      };
    };

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
    };
  };
}
