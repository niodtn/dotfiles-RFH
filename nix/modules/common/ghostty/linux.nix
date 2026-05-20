{
  lib,
  config,
  self,
  options,
  ...
}: {
  config = lib.mkIf config.modules.ghostty (lib.mkMerge [
    (self.isLinux options (lib.mkMerge [
      {
        home-manager.users.${config.userName}.programs.ghostty = {
          systemd.enable = true;
        };
      }
    ]))
  ]);
}
