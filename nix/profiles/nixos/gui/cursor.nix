{
  config,
  pkgs,
  ...
}: {
  # Home Manager
  home-manager.users.${config.userName}.home = {
    pointerCursor = {
      enable = true;
      gtk.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 20;
    };
  };
}
