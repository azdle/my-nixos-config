{ config, lib, pkgs, ... }:

{
  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.nginx = {
    enable = true;
    virtualHosts = {
      "data.poop.casa" = {
        #forceSSL = true;
        #enableACME = true;
        locations."/" = {
          proxyPass = "http://localhost:3000";
        };
      };
    };
  };

  environment.systemPackages = with pkgs; [
    influxdb # for `influx` cli tool
  ];

  services.influxdb.enable = true;
  services.grafana.enable = true;
}

