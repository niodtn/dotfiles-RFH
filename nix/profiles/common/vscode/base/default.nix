{config, ...}: let
  marketplace = inputs.vscode-extensions.extensions.${pkgs.stdenv.hostPlatform.system}.vscode-marketplace;
in {
  imports = [
    ./integrations
    ./lang
    ./keybindings.nix
    ./themes.nix
    ./usersettings.nix
  ];

  home-manager.users.${config.userName}.programs.vscode = {
    profiles.default.extensions = with marketplace; [esbenp.prettier-vscode];
  };
}
