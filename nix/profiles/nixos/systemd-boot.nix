{lib, ...}: {
  boot.loader = {
    systemd-boot = {
      enable = true;
      consoleMode = "max";
      configurationLimit = lib.mkDefault 10;
    };
    efi.canTouchEfiVariables = true;
  };
}
