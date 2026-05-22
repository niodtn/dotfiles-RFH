{pkgs, ...}: {
  imports = [
    ./default.nix
    ./fcitx5.nix
  ];

  xdg.portal = {
    extraPortals = [pkgs.kdePackages.xdg-desktop-portal-kde];
    config.kde.default = ["kde" "gtk"];
  };

  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    desktopManager.plasma6.enable = true;
  };
  security.pam.services.login.enableKwallet = true;
}
