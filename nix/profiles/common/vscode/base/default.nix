{
  inputs,
  config,
  ...
}: let
  marketplace = inputs.vscode-extensions.extensions.${config.platform}.vscode-marketplace;
in {
  imports = [
    ./integrations
    ./lang
    ./keybindings.nix
    ./themes.nix
    ./usersettings.nix
  ];

  _module.args.marketplace = inputs.vscode-extensions.extensions.${config.platform}.vscode-marketplace;

  home-manager.users.${config.userName}.programs.vscode = {
    profiles.default.extensions = with marketplace; [esbenp.prettier-vscode];
  };
}
