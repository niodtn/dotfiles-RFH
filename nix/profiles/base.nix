{
  self,
  ...
}: {
  imports = [
    (self.paths.modules "common/identify.nix")
  ];

  # Nix
  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    settings = {
      experimental-features = "nix-command flakes";
      # gc
      auto-optimise-store = true;
      # caches
      extra-substituters = self.caches.substituters;
      extra-trusted-public-keys = self.caches.trustedPublicKeys;
    };
  };
  nixpkgs.config.allowUnfree = true;

  # Shell Aliases
  environment.shellAliases = {
    ll = "ls -l";
    ".." = "cd ../";
    "..." = "cd ../../";
  };

  # Home Manager
  home-manager.backupFileExtension = "backup";
}
