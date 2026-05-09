{
  options,
  lib,
  config,
  pkgs,
  ...
}: let
  isLinux = options ? boot;
  isDarwin = options ? homebrew;
in {
  config = lib.mkMerge [
    # Common
    {
      home-manager.users.${config.userName}.programs.ghostty = {
        enable = true;
        settings = {
          background-opacity = 0.9;
          background-blur-radius = 10;
        };
      };
    }

    # Linux
    (optionalAttrs isLinux {
      home-manager.users.${config.userName}.programs.ghostty = {
        systemd.enable = true;
      };
    })

    # Darwin
    (optionalAttrs isDarwin {
      home-manager.users.${config.userName}.programs.ghostty = {
        package = pkgs.ghostty-bin;
        settings = {
          background = "000000";
          foreground = "ffffff";
          window-padding-x = 25;
          window-padding-balance = true;
          macos-titlebar-style = "tabs";
          # macos-icon = "blueprint";
          macos-secure-input-indication = false;
        };
      };
    })
  ];
}
