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
    resw = "sudo darwin-rebuild switch --flake ~/dotfiles#${config.hostName}";
    rebu = "darwin-rebuild build --flake ~/dotfiles#${config.hostName}";
    tssh = "tailscale ssh";
  };

  # Homebrew
  homebrew.casks = ["tailscale-app"];

  # Home Manager
  users.users.${config.userName}.home = "/Users/${config.userName}";
  home-manager.users.${config.userName}.imports = [inputs.mac-app-util.homeManagerModules.default];
}
