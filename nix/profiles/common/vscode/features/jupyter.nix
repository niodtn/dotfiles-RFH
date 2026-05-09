{
  inputs,
  pkgs,
  config,
  ...
}: let
  marketplace = inputs.vscode-extensions.extensions.${pkgs.stdenv.hostPlatform}.vscode-marketplace;
in {
  home-manager.users.${config.userName}.programs.vscode.profiles.default.extensions = with marketplace; [
    ms-toolsai.jupyter-keymap
    ms-toolsai.jupyter-renderers
    ms-toolsai.vscode-jupyter-cell-tags
    ms-toolsai.vscode-jupyter-slideshow
  ];
}
