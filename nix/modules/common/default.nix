{lib, ...}: {
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
}
