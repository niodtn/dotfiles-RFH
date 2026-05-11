{config, ...}: {
  home-manager.users.${config.userName}.programs.firefox.policies = {
    ExtensionSettings = {
      "firefox@tampermonkey.net" = {
        install_url = "https://addons.mozilla.org/firefox/downloads/latest/tampermonkey/latest.xpi";
        installation_mode = "force_installed";
      };
    };

    # "3rdparty".Extensions."firefox@tampermonkey.net" = {
    # };
  };
}
