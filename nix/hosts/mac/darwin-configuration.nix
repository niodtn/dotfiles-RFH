{
  flake,
  pkgs,
  perSystem,
  config,
  ...
}: {
  features = {
    ## shell
    python.enable = true;
    starship.enable = true;

    ## gui
    ghostty.enable = true;
    vesktop.enable = true;
    zen-browser.enable = true;
    vscode = {
      enable = true;
      nix.enable = true;
      markdown.enable = true;
    };
  };
}
