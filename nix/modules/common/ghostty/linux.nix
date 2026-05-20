{
  lib,
  config,
  self,
  options,
  pkgs,
  ...
}: {
  config = lib.mkIf config.modules.ghostty (lib.mkMerge [
    (self.isLinux options (lib.mkMerge [
      # Base
      {
        home-manager.users.${config.userName}.programs.ghostty = {
          systemd.enable = true;
        };
      }

      # GNOME
      (lib.mkIf (config.services.desktopManager.gnome.enable or false) {
        environment.gnome.excludePackages = [pkgs.gnome-console];
      })
    ]))
  ]);
}
