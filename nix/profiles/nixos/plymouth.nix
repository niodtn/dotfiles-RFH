# Ref: https://wiki.nixos.org/wiki/Plymouth
{pkgs, ...}: {
  boot = {
    plymouth = {
      enable = true;
      theme = "rings";
      themePackages = with pkgs; [
        # By default we would install all themes
        (adi1090x-plymouth-themes.override {
          selected_themes = ["rings"];
        })
      ];
    };

    kernelParams = [
      "quiet"
      "splash"
      "udev.log_level=3"
      "systemd.show_status=auto"
    ];
  };
}
