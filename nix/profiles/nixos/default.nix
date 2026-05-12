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

  programs.nix-ld.enable = true;

  fonts.packages = [pkgs.noto-fonts-cjk-sans];

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

    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = true;
      };
    };

    dbus.enable = true;
  };
}
