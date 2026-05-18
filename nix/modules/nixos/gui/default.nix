{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.gui;
in {
  options.features.gui = {
    enable = mkEnableOption "gui feature";
  };

  imports = [
    #./hyprland
    #./niri
    #./cosmic.nix
    ./labwc.nix
  ];

  config = mkIf cfg.enable {
    xdg.portal = {
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
      ];
    };
  };
}
