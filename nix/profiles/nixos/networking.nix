{config, ...}: {
  networking = {
    networkmanager.enable = true;
    firewall.enable = true;
  };

  users.users.${config.userName}.extraGroups = ["networkmanager"];
}
