{
  options,
  lib,
  ...
}: let
  isLinux = options ? boot;
  isDarwin = options ? homebrew;
in {
  config = lib.mkMerge [
    # Linux
    (lib.optionalAttrs isLinux {
      networking.firewall.trustedInterfaces = ["tailscale0"];

      services = {
        tailscale = {
          enable = true;
          extraUpFlags = ["--ssh"];
        };

        openssh = {
          enable = true;
          settings = {
            PermitRootLogin = "no";
            PasswordAuthentication = false;
          };
        };
      };
    })

    # Darwin
    (lib.optionalAttrs isDarwin {
      homebrew.casks = ["tailscale-app"];
    })
  ];
}
