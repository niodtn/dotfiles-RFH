{
  lib,
  config,
  ...
}: {
  config = lib.mkMerge [
    {
      home-manager.users.${config.userName}.programs.zellij = {
        enable = true;
      };
    }

    (lib.mkIf config.programs.zsh.enable {
      home-manager.users.${config.userName}.programs.zellij = {
        enableZshIntegration = true;
        settings = {
          default_shell = "zsh";
        };
      };
    })
  ];
}
