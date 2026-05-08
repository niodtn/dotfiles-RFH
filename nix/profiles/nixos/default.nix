{
  inputs,
  self,
  config,
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

  services.dbus.enable = true;
  security.polkit.enable = true;

  services = {
    tailscale = {
      enable = true;
      extraUpFlags = ["--ssh"];
    };
  };
}
