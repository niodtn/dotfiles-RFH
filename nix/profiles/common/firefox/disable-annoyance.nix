{
  config,
  mkLocked,
  ...
}: {
  home-manager.users.${config.userName}.programs.firefox = {
    policies.Preferences = {
      "browser.discovery.enabled" = mkLocked false;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = mkLocked false;
      "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = mkLocked false;
      "browser.shell.checkDefaultBrowser" = mkLocked false;
      "extensions.htmlaboutaddons.recommendations.enabled" = mkLocked false;
    };
  };
}
