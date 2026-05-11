{lib, ...}: {
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
        configurationLimit = lib.mkDefault 5;
      };

      timeout = 2;
      efi.canTouchEfiVariables = lib.mkDefault true;
    };

    initrd = {
      verbose = false;
      systemd.enable = true;
    };

    consoleLogLevel = 3;
    tmp.cleanOnBoot = true;
  };
}
