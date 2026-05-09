{config, ...}: {
  services.getty.autologinUser = config.userName;
}
