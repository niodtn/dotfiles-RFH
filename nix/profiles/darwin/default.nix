{
  inputs,
  self,
  config,
  ...
}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager
    (self.paths.profiles "base.nix")
  ];

  # Nix
  environment.shellAliases = {
    rebuild = "sudo darwin-rebuild switch --flake ~/dotfiles#${config.hostName}";
  };

  # Home Manager
  users.users.${config.userName}.home = "/Users/${config.userName}";
}
