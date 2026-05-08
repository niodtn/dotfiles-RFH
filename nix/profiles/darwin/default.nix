{
  inputs,
  self,
  config,
  ...
}: {
  imports = [
    inputs.home-manager.darwinModules.home-manager
    (self.paths.profiles "base.nix")
    ./homebrew.nix
  ];

  # Nix
  environment.shellAliases = {
    rebuild = "sudo darwin-rebuild switch --flake ~/dotfiles#${config.hostName}";
  };

  # Homebrew
  homebrew.casks = ["tailscale-app"];

  # Home Manager
  users.users.${config.userName}.home = "/Users/${config.userName}";
}
