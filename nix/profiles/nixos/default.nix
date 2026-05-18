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
  environment = {
    shellAliases = {
      resw = "sudo nixos-rebuild switch --flake ~/dotfiles#${config.hostName}";
      rebo = "sudo nixos-rebuild boot --flake ~/dotfiles#${config.hostName}";
      rebu = "nixos-rebuild build --flake ~/dotfiles#${config.hostName}";
    };
    systemPackages = [pkgs.xdg-utils];
  };

  users.users.${config.userName} = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  security.polkit.enable = true;
  services.dbus.enable = true;

  documentation.nixos.enable = false;

  programs.nix-ld.enable = true;

  fonts.packages = [pkgs.noto-fonts-cjk-sans];
}
