{
  config,
  lib,
  ...
}: let
  mkLocked = value: {
    Value = value;
    Status = "locked";
  };
in {
  imports = [
    ./bitwarden.nix
    ./disable-annoyance.nix
    ./tampermonkey.nix
    ./ublock-origin.nix
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
        "browser.toolbars.bookmarks.visibility" = lib.mkDefault (mkLocked "never");
      };
    };

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
    };
  };
}
