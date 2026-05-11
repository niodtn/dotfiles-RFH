{config, ...}: {
  home-manager.users.${config.userName}.programs.firefox.policies = {
    ExtensionSettings = {
      "uBlock0@raymondhill.net" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
        installation_mode = "force_installed";
      };
    };

    "3rdparty".Extensions = {
      "uBlock0@raymondhill.net".adminSettings = {
        userSettings = {
          advancedUserEnabled = true;
          cloudStorageEnabled = false;
        };
      };
    };
  };
}
