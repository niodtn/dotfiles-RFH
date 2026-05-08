{lib, ...}: {
  options = {
    hostName = lib.mkOption {
      type = lib.types.str;
    };
    userName = lib.mkOption {
      type = lib.types.str;
      default = "niodtn";
    };
  };
}
