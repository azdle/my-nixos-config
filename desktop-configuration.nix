{ ... }:

{
  # Pretty Splashscreens From Boot
  boot.plymouth.enable = true;

  services.xserver = {
    enable = true;
    layout = "us";

    desktopManager.gnome3.enable = true;
  };
}

