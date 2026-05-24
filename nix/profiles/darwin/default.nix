{
  inputs,
  self,
  config,
  ...
}: {
  imports = [
    inputs.mac-app-util.darwinModules.default
    inputs.home-manager.darwinModules.home-manager
    (self.paths.profiles "base.nix")
    ./homebrew.nix
  ];

  home-manager.users.${config.userName}.imports = [inputs.mac-app-util.homeManagerModules.default];
}
