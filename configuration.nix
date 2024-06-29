{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ] ++ (lib.optional (builtins.pathExists /home/dev/user.nix) /home/dev/user.nix);

    boot.loader.grub.device = "/dev/sda";
    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = true;
    };

    console = {
        useXkbConfig = true;
    };

    virtualisation.virtualbox.guest.enable = true;

    environment.systemPackages = with pkgs; [
      ansible
      git
      yadm
    ];

    users = {
      mutableUsers = false;
      users = {
        root = {
          password = "1234"; #1234
        };
        dev = {
          password = "1234"; #1234
          isNormalUser = true;
          createHome = true;
          extraGroups = [ "wheel" ];
          group = "users";
          home = "/home/dev";
        };
      };
    };
}
