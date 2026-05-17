{
  lib,
  config,
  marketplace,
  self,
  options,
  ...
}: {
  config = lib.mkMerge [
    {
      home-manager.users.${config.userName}.programs.vscode.profiles.default = {
        extensions = with marketplace; [
          mkhl.direnv
          joshx.workspace-terminals
        ];

        userSettings = {
          "direnv.restart.automatic" = true;
        };
      };
    }

    (self.isDarwin options {
      home-manager.users.${config.userName}.programs.vscode.profiles.default = {
        userSettings = {
          "terminal.integrated.env.osx" = {
            "DIRENV_LOG_FORMAT" = "-";
          };
        };
      };
    })
  ];
}
