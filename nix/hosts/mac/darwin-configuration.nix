{
  flake,
  pkgs,
  perSystem,
  config,
  ...
}: {
  features = {
    zsh.enable = true;

    ## shell
    atuin.enable = true;
    comma.enable = true;
    direnv.enable = true;
    git.enable = true;
    jujutsu.enable = true;
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
