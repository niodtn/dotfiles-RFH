{
  inputs,
  self,
  pkgs,
  config,
  ...
}: {
  imports = [
    (self.paths.modules "common")
    (self.paths.profiles "common/shell")
    (self.paths.profiles "common/tailscale.nix")
  ];

  # Nix
  nix = {
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        # "ca-derivations"
        # "fetch-closure"
      ];
      # gc
      auto-optimise-store = true;
      # caches
      extra-substituters = ["https://nix-community.cachix.org"];
      extra-trusted-public-keys = ["nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="];
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    overlays = [inputs.nur.overlays.default];
  };

  environment = {
    systemPackages = [
      pkgs.uv # Python Version Manager
    ];
  };

  # Home Manager
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
  };
}
