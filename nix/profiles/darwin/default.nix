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
  nix.settings = {
    extra-substituters = ["https://nix-darwin.cachix.org"];
    extra-trusted-public-keys = ["nix-darwin.cachix.org-1:LxMyKzQk7Uqkc1Pfq5uhm9GSn07xkERpy+7cpwc006A="];
  };
}
