{
  inputs,
  config,
  ...
}: {
  imports = [inputs.nix-homebrew.darwinModules.nix-homebrew];

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    onActivation.upgrade = true;
    brews = ["mas"];
  };

  nix-homebrew = {
    enable = true;
    user = config.userName;
    enableRosetta = true;
    autoMigrate = true;
  };
}
