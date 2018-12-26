{ config, lib, pkgs, ... }:

{
  programs.ssh.startAgent = false;

  services.pcscd.enable = true;

  environment.systemPackages = with pkgs; [
    gnupg
  ];

  environment.shellInit = ''
    gpg-connect-agent /bye
    set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
  '';
}

# Note I had to manually `mkdir ~/.gnupg` for some reason.
  
