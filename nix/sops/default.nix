{pkgs, ...}: {
  environment.systemPackages = [
    pkgs.sops
    pkgs.age
  ];
}
