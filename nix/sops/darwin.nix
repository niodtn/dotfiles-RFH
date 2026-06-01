{
  config,
  inputs,
  ...
}: {
  imports = [./default.nix];

  # Home Manager
  home-manager.users.${config.userName} = {
    imports = [inputs.sops-nix.homeManagerModules.sops];

    home.sessionVariables = {
      SOPS_AGE_KEY_FILE = "${config.users.users.${config.userName}.home}/.config/sops/age/keys.txt";
    };

    sops = {
      age.generateKey = true;
      age.keyFile = keyFilePath;
    };
  };
}
