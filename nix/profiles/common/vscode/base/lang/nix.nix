{
  config,
  pkgs,
  marketplace,
  ...
}: {
  # Nix
  environment.systemPackages = [pkgs.alejandra];

  # Home Manager
  home-manager.users.${config.userName}.programs.vscode.profiles.default = {
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
}
