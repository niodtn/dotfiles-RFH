{
  options,
  lib,
  config,
  ...
}: let
  isDarwin = options ? homebrew;
in {
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
    (lib.optionalAttrs isDarwin {
      networking.computerName = config.hostName;
      networking.localHostName = config.hostName;
      users.users.${config.userName}.home = "/Users/${config.userName}";
    })
  ];
}
