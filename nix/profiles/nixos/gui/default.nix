{
  pkgs,
  config,
  lib,
  ...
}: {
  # Nix
  users.users.${config.userName}.extraGroups = ["video"];

  programs.xwayland.enable = true;

  environment = {
    systemPackages = [pkgs.xdg-utils];
    variables = {
      XDG_SESSION_TYPE = "wayland";
      NIXOS_OZONE_WL = "1";

      GTK_IM_MODULE = "fcitx";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    config.common.default = lib.mkDefault ["gtk"];
  };
}
