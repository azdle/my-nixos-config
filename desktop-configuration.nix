{ ... }:

{
  # Pretty Splashscreens From Boot
  boot.plymouth.enable = true;

  hardware.bluetooth.enable = true;

  services.xserver = {
    enable = true;
    layout = "us";

    displayManager.gdm.enable = true;
    desktopManager.gnome3.enable = true;
  };

  programs.wireshark.enable = true;
}

