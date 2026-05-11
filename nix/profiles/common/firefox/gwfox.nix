# https://github.com/akkva/gwfox
{
  options,
  config,
  lib,
  mkLocked,
  pkgs,
  ...
}: let
  isLinux = options ? boot;
  isDarwin = options ? homebrew;
in {
  home-manager.users.${config.userName}.programs.firefox = {
    policies.Preferences = lib.mkMerge [
      {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = lib.mkDefault (mkLocked true);
        "svg.context-properties.content.enabled" = mkLocked true;
        "browser.toolbars.bookmarks.visibility" = mkLocked "always";
      }

      # Linux
      (lib.optionalAttrs isLinux {
        "widget.gtk.rounded-bottom-corners.enabled" = mkLocked true;
      })

      # Darwin
      (lib.optionalAttrs isDarwin {
        "widget.macos.native-context-menus" = mkLocked false;
      })
    ];

    profiles.default = {
      settings = {
        "allow_transparent_browser" = true;

        # gwfox
        "gwfox.icons" = true;
        "gwfox.toolbar" = true;
      };
      userChrome = builtins.readFile (pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/akkva/gwfox/refs/heads/main/userChrome.css";
        sha256 = "sha256-aJqoZA0xYYC2/vuVzkX9CdofdFloWtDx5TwVeOqGsP0=";
      });
      userContent = builtins.readFile (pkgs.fetchurl {
        url = "https://raw.githubusercontent.com/akkva/gwfox/refs/heads/main/userContent.css";
        sha256 = "sha256-KHHaPmkbJxOGTjTpmF87Em+My7Xp8Ub+AaZ9B/kdPsE=";
      });
    };
  };
}
