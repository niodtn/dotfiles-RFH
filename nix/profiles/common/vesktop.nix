{
  lib,
  config,
  self,
  options,
  ...
}: {
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
    (self.isLinux options {
      home-manager.users.${config.userName}.programs.vesktop = {
        vencord.useSystem = true;
      };
    })

    # Darwin
    (self.isDarwin options {
      home-manager.users.${config.userName}.programs.vesktop = {
        package = self.packages.${config.platform}.vesktop-bin;
      };
    })
  ];
}
