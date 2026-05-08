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
}
