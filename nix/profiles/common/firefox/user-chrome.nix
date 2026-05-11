{config, ...}: {
  home-manager.users.${config.userName}.programs.firefox = {
    policies.Preferences = {
      "toolkit.legacyUserProfileCustomizations.stylesheets" = {
        Value = true;
        Status = "locked";
      };
    };

    profiles.default.userChrome = ''
      #firefox-view-button { display: none !important; }
      #tabbrowser-tabs { border-inline-start: none !important; }

      .titlebar-spacer[type="pre-tabs"] { display: none !important; }
    '';
  };
}
