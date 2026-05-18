{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./default.nix
    ./cursor.nix
  ];

  services = {
    blueman.enable = lib.mkForce false;

    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = with pkgs; [
    gnome-connections
    gnome-contacts
    gnome-maps
    gnome-tour
  ];
}
