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
}
