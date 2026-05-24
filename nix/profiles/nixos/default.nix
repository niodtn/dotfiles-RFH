{
  inputs,
  self,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    (self.paths.profiles "base.nix")
  ];

  # Nix
  users.users.${config.userName} = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  security.polkit.enable = true;
  services.dbus.enable = true;

  environment.systemPackages = [pkgs.xdg-utils];

  documentation.nixos.enable = false;

  programs.nix-ld.enable = true;

  fonts.packages = [pkgs.noto-fonts-cjk-sans];
}
