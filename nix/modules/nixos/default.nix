{
  lib,
  pkgs,
  config,
  ...
}:
with lib; {
  imports = [
    ../common

    ./gui

    ./bluetooth.nix
    ./i18n.nix
    ./interop.nix
    ./plymouth.nix
    ./sound.nix
    ./systemd-boot.nix
    ./tty-autologin.nix
  ];

  config = {
    # For Windows dual-boot
    time.hardwareClockInLocalTime = true;


    fonts.packages = with pkgs; [
      noto-fonts-cjk-sans
    ];

    programs.nix-ld.enable = true;

    users.users.${config.username} = {
      isNormalUser = mkDefault true;
    };
  };
}
