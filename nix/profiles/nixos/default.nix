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
  environment.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake ~/dotfiles#${config.hostName}";
  };

  services = {
    tailscale = {
      enable = true;
      extraUpFlags = ["--ssh"];
    };
  };
}
