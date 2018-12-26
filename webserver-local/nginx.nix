{ config, lib, pkgs, ... }:

{
    networking.firewall.allowedTCPPorts = [ 80 443 ];

    services.nginx = {
      enable = true;
      virtualHosts = {
        "sulfur.psbarrett.com" = {
          locations."/" = {
            #root = "/home/patrick/sulfur";
            root = "${pkgs.nginx}/html";
          };
        };
      };
    };

}
