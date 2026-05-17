{pkgs, ...}: {
  services.kmscon = {
    enable = true;
    hwRender = true;
    fonts = [
      {
        name = "D2CodingLigature Nerd Font";
        package = pkgs.nerd-fonts.d2coding;
      }
    ];
    extraConfig = "font-size=14";
  };
}
