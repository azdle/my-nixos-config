{ pkgs, ... }:

{
  # Required for displaylink
  nixpkgs.config.allowUnfree = true;

  # Pretty Splashscreens From Boot
  boot.plymouth.enable = true;

  hardware.bluetooth.enable = true;

  # For Steam
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  users.extraUsers.patrick = {
    isNormalUser = true;
    home = "/home/patrick";
    shell = pkgs.fish;
    description = "Patrick Barrett";
    extraGroups = [ "wheel" "networkmanager" "dialout" "wireshark" "vboxusers" "fuse"];
  };

  services.xserver = {
    enable = true;
    layout = "us";

    displayManager.gdm.enable = true;
    desktopManager.gnome3.enable = true;

    videoDrivers = [ "intel" "displaylink" ];
  };

  boot.kernelModules = [ "kvm-intel" "fuse" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.virtualbox.host.enable = true;

  programs.fish.enable = true;
  programs.wireshark.enable = true;

  environment.systemPackages = with pkgs; [
    chrome-gnome-shell
    platformio
    fuse
  ];

  # hotplug rules
  services.udev.extraRules = ''
    # FabISP (sparkfun attiny) programmer
    SUBSYSTEM=="usb", ACTION="add", ATTR{idVendor}=="1781", ATTR{idProduct}=="0c9f", GROUP="dialout", MODE="0666"

    # Steam Controller
    SUBSYSTEM=="usb", ATTRS{idVendor}=="28de", MODE="0666"
    KERNEL=="uinput", MODE="0660", GROUP="users", OPTIONS+="static_node=uinput"
  '';

  networking.extraHosts = ''
    127.0.0.1 rainb.in
  '';
}

