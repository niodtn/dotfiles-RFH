{
  lib,
  config,
  self,
  options,
  ...
}: {
  options = {
    platform = lib.mkOption {
      type = lib.types.str;
    };

    hostName = lib.mkOption {
      type = lib.types.str;
    };
    userName = lib.mkOption {
      type = lib.types.str;
      default = "niodtn";
    };
  };

  config = lib.mkMerge [
    # Common
    {
      networking.hostName = config.hostName;
    }

    # Darwin
    (self.isDarwin options {
      networking.computerName = config.hostName;
      networking.localHostName = config.hostName;
      system.primaryUser = config.userName;
      users.users.${config.userName}.home = "/Users/${config.userName}";
    })
  ];
}
