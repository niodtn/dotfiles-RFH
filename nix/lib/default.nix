{
  inputs,
  self,
  ...
}: {
  flake = {
    paths = import ./paths.nix {inherit self;};

    isDarwin = options: attrs:
      inputs.nixpkgs.lib.optionalAttrs (!(options ? boot)) attrs;
    isLinux = options: attrs:
      inputs.nixpkgs.lib.optionalAttrs (options ? boot) attrs;
  };
}
