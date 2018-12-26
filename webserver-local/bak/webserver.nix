{
  webserver =
    { config, pkgs, ... }:
    { networking.firewall.allowedTCPPorts = [ 80 443 ];

      services.nginx = {
        enable = true;
        virtualHosts = {
          "sulfur.psbarrett.com" = {
            forceSSL = true;
            enableACME = true;
            locations."/" = {
              root = "/home/patrick/sulfur";
            };
          };
        };
      };
  };

}
