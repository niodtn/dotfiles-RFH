{
  self,
  lib,
  config,
  options,
  ...
}: {
  imports = [(self.paths.modules "common/ghostty")];

  config = lib.mkMerge [
    # Common
    {
      home-manager.users.${config.userName}.programs.ghostty = {
        settings = {
          background-opacity = 0.9;
          background-blur-radius = 10;
        };
      };
    }

    # # Linux
    # (self.isLinux options {
    #   home-manager.users.${config.userName}.programs.ghostty = {
    #
    #   };
    # })

    # Darwin
    (self.isDarwin options {
      home-manager.users.${config.userName}.programs.ghostty = {
        settings = {
          background = "000000";
          foreground = "ffffff";
          window-padding-x = 25;
          window-padding-balance = true;

          macos-icon = "blueprint";
          macos-secure-input-indication = false;
        };
      };
    })
  ];
}
