{config, ...}: {
  networking = {
    networkmanager.enable = true;
    hostName = config.hostName;
  };

  users.users.${config.userName}.extraGroups = ["networkmanager"];
}
