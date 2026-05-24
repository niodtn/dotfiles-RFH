{
  lib,
  config,
  self,
  options,
  ...
}: {
  config = lib.mkMerge [
    # Both
    {
      # Nix
      environment.shellAliases = {
        ll = "ls -al";
        ".." = "cd ../";
        "..." = "cd ../../";

        cloc = "nix run nixpkgs#cloc --";
      };

      # Home Manager
      home-manager.users.${config.userName}.home.shellAliases = config.environment.shellAliases;
    }

    # Linux
    (self.isLinux options {
      environment.shellAliases = {
        resw = "sudo nixos-rebuild switch --flake ~/dotfiles#${config.hostName}";
        rebo = "sudo nixos-rebuild boot --flake ~/dotfiles#${config.hostName}";
        rebu = "nixos-rebuild build --flake ~/dotfiles#${config.hostName}";
      };
    })

    # Darwin
    (self.isDarwin options {
      environment.shellAliases = {
        resw = "sudo darwin-rebuild switch --flake ~/dotfiles#${config.hostName}";
        rebu = "darwin-rebuild build --flake ~/dotfiles#${config.hostName}";
      };
    })
  ];
}
