{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ] ++ lib.optional (builtins.pathExists /home/dev/user.nix) [ /home/dev/user.nix ];

    boot.loader.grub.device = "/dev/sda";
    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
    };

    console = {
        useXkbConfig = true;
    };

    #services.xserver = {
    #    enable = true;
    #    layout = "de";
    #};

    virtualisation.virtualbox.guest.enable = true;

    environment.systemPackages = with pkgs; [
      ansible
    ];

    users = {
      mutableUsers = false;
      users = {
        root = {
          initialPassword = "1234"; #1234
        };
        dev = {
          initialPassword = "1234"; #1234
          isNormalUser = true;
          createHome = true;
          extraGroups = [ "wheel" ];
          group = "users";
          home = "/home/dev";
        };
      };
    };
}
