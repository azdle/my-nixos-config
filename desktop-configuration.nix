{ ... }:

{
  # Pretty Splashscreens From Boot
  boot.plymouth.enable = true;

  hardware.bluetooth.enable = true;

  users.extraUsers.patrick = {
    isNormalUser = true;
    home = "/home/patrick";
    shell = pkgs.fish;
    description = "Patrick Barrett";
    extraGroups = [ "wheel" "networkmanager" "dialout" "wireshark" ];
  };

  services.xserver = {
    enable = true;
    layout = "us";

    displayManager.gdm.enable = true;
    desktopManager.gnome3.enable = true;

    videoDrivers = [ "displaylink" ];
  };

  programs.fish.enable = true;
  programs.wireshark.enable = true;
}

