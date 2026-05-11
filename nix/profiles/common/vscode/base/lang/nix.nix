{
  config,
  pkgs,
  marketplace,
  ...
}: {
  home-manager.users.${config.userName} = {
    home.packages = [pkgs.alejandra];

    programs.vscode.profiles.default = {
      extensions = with marketplace; [
        jnoortheen.nix-ide
        kamadorueda.alejandra
      ];

      userSettings = {
        "[nix]" = {
          "editor.defaultFormatter" = "kamadorueda.alejandra";
          "editor.formatOnPaste" = true;
          "editor.formatOnSave" = true;
          "editor.formatOnType" = false;
        };
        "alejandra.program" = "alejandra";
      };
    };
  };
}
