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
    variables = {NIXOS_OZONE_WL = "1";};
  };

  xdg.portal = {
    enable = true;
    extraPortals = [pkgs.xdg-desktop-portal-gtk];
    config.common.default = lib.mkDefault ["gtk"];
  };
}
