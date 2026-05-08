{
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.jujutsu;
in {
  options.features.jujutsu = {
    enable = mkEnableOption "jujutsu feature";
  };

  config = mkIf cfg.enable {
    home-manager.users.${config.username} = {
      # For VSCode
      programs.vscode.profiles.default = mkIf config.features.vscode.enable {
        extensions = [
          pkgs.vscode-extensions.visualjj.visualjj
        ];
      };
    };
  };
}
