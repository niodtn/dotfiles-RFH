{self}: {
  profiles = path: "${self}/nix/profiles/${path}";
  modules = path: "${self}/nix/modules/${path}";
  sops = path: "${self}/nix/sops/${path}";
}
