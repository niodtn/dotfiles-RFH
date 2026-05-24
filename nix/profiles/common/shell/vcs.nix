{
  pkgs,
  config,
  ...
}: let
  userName = "niodtn";
  userEmail = "ipete93@gmail.com";
in {
  # Nix
  environment = {
    systemPackages = [pkgs.github-cli];
  };

  # Home Manager
  home-manager.users.${config.userName}.programs = {
    git = {
      enable = true;
      settings.user.name = userName;
      settings.user.email = userEmail;
    };

    jujutsu = {
      enable = true;
      settings = {
        user.name = userName;
        user.email = userEmail;

        ui.default-commnad = "log";
        revset-aliases."immutable_heads()" = "trunk() | tags()";
      };
    };
  };
}
