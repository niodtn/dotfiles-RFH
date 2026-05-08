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
      rebuild = "sudo nixos-rebuild switch --flake ~/dotfiles#${config.hostName}";
    };
    systemPackages = [pkgs.xdg-utils];
  };

  programs.nix-ld.enable = true;

  fonts.packages = [pkgs.noto-fonts-cjk-sans];

  services.dbus.enable = true;
  security.polkit.enable = true;

  users.users.${config.userName} = {
    isNormalUser = true;
    extraGroups = ["wheel"];
  };

  services = {
    tailscale = {
      enable = true;
      extraUpFlags = ["--ssh"];
    };
  };
}
