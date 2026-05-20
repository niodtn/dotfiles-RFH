{
  lib,
  config,
  self,
  options,
  pkgs,
  ...
}: {
  imports = [
    ./linux.nix
  ];

  options.modules.ghostty = lib.mkOption {
    type = lib.types.bool;
    default = true;
  };

  config = lib.mkIf config.modules.ghostty (lib.mkMerge [
    # Both
    {
      home-manager.users.${config.userName}.programs.ghostty = {
        enable = true;
      };
    }

    # Darwin
    (self.isDarwin options {
      home-manager.users.${config.userName}.programs.ghostty = {
        package = pkgs.ghostty-bin;
        settings = {
          macos-titlebar-style = "tabs";
          macos-option-as-alt = true;
        };
      };
    })
  ]);
}
