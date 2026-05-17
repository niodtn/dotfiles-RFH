{
  lib,
  config,
  inputs,
  pkgs,
  self,
  options,
  ...
}: {
  config = lib.mkMerge [
    # Common
    {
      home-manager.users.${config.userName} = {
        imports = [inputs.zen-browser.homeModules.beta];
        programs.zen-browser = {
          enable = true;

          policies = {
            DisableAppUpdate = true;
            DontCheckDefaultBrowser = true;
            DisableTelemetry = true;
            NoDefaultBookmarks = true;
            DisableFirefoxAccounts = true;
            OfferToSaveLogins = false;

            AutofillAddressEnabled = false;
            AutofillCreditCardEnabled = false;

            EnableTrackingProtection = {
              Value = true;
              Locked = true;
              Cryptomining = true;
              Fingerprinting = true;
            };
          };

          profiles.default = {
            id = 0;

            extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
              ublock-origin
              bitwarden
            ];

            settings = {
              "zen.welcome-screen.seen" = true;
              "zen.workspaces.natural-scroll" = true;
              "zen.view.compact.enable-at-startup" = true;
              "zen.view.compact.hide-tabbar" = true;
              "zen.view.compact.hide-toolbar" = false;
              "browser.aboutConfig.showWarning" = false;
              "browser.tabs.warnOnClose" = false;
              "browser.ctrlTab.sortByRecentlyUsed" = true;
            };

            mods = [
              "72f8f48d-86b9-4487-acea-eb4977b18f21" # Better CtrlTab Panel
            ];

            search = {
              force = true;
              default = "google";
              engines = {
                "Nix Pkgs" = {
                  urls = [
                    {
                      template = "https://search.nixos.org/packages";
                      params = [
                        {
                          name = "type";
                          value = "packages";
                        }
                        {
                          name = "channel";
                          value = "unstable";
                        }
                        {
                          name = "query";
                          value = "{searchTerms}";
                        }
                      ];
                    }
                  ];
                  definedAliases = ["pkgs"];
                };

                "Nix Options" = {
                  urls = [
                    {
                      template = "https://mynixos.com/search";
                      params = [
                        {
                          name = "q";
                          value = "option+{searchTerms}";
                        }
                      ];
                    }
                  ];
                  definedAliases = ["opts"];
                };
              };
            };
          };
        };
      };
    }

    # Linux
    (self.isLinux options {
      home-manager.users.${config.userName}.programs.zen-browser = {
        nativeMessagingHosts = [pkgs.firefoxpwa];
      };
    })

    # Darwin
    (self.isDarwin options {
      home-manager.users.${config.userName}.programs.zen-browser = {
        darwinDefaultsId = "app.zen-browser.zen";
      };
    })
  ];
}
