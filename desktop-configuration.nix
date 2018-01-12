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

  boot.kernelModules = [ "kvm-intel" ];
  virtualisation.libvirtd.enable = true;

  programs.fish.enable = true;
  programs.wireshark.enable = true;

  # hotplug rules for FabISP (sparkfun attiny) programmer
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ACTION="add", ATTR{idVendor}=="1781", ATTR{idProduct}=="0c9f", GROUP="dialout", MODE="0666"
  '';
}

