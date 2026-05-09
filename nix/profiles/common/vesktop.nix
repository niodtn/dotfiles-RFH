{
  self,
  options,
  lib,
  config,
  ...
}: let
  isLinux = options ? boot;
  isDarwin = options ? homebrew;
in {
  config = lib.mkMerge [
    # Common
    {
      home-manager.users.${config.userName}.programs.vesktop = {
        enable = true;
        settings = {
          checkUpdates = false;
          hardwareAcceleration = true;
        };
        vencord.settings = {
          autoUpdate = false;
          autoUpdateNotification = false;
          notifyAboutUpdates = false;
          plugins = {
            FakeNitro.enabled = true;
            NoF1.enabled = true;
            Translate.enabled = true;
            SilentTyping.enabled = true;
            MessageLogger = {
              enabled = true;
              ignoreSelf = true;
            };
          };
        };
      };
    }

    # Linux
    (lib.optionalAttrs isLinux {
      home-manager.users.${config.userName}.programs.vesktop = {
        vencord.useSystem = true;
      };
    })

    # Darwin
    (lib.optionalAttrs isDarwin {
      home-manager.users.${config.userName}.programs.vesktop = {
        package = self.packages.${config.platform}.vesktop-bin;
      };
    })
  ];
}
