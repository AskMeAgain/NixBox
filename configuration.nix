{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ] ++ lib.optional (builtins.pathExists /home/dev/user.nix) [ /home/dev/user.nix ];

    boot.loader.grub.device = "/dev/sda";
    services.openssh = {
      enable = true;
    };

    console = {
        keyMap = "de";
    };

    services.xserver = {
        enable = true;
        xkb.layout = "de";
        layout = "de";
    };

    virtualisation.virtualbox.guest.enable = true;

    environment.systemPackages = with pkgs; [
      ansible
    ];

    i18n = {
      consoleFont = "Lat2-Terminus16";
      consoleKeyMap = "de";
      defaultLocale = "de_DE.UTF-8";
    };

    users = {
      mutableUsers = true;
      users = {
        root = {
          initialHashedPassword = "$6$jUFVxfhcAsgEMI6q$L/hHdbPClSqJCbDuCor4vqkX8U37vJthK4dRaSqAxkcB/gXRiVvGixQXvsR.91MDUEWbNUeCEnEt2fhg9mn8m/"; #1234
        };
        dev = {
          initialHashedPassword = "$6$jUFVxfhcAsgEMI6q$L/hHdbPClSqJCbDuCor4vqkX8U37vJthK4dRaSqAxkcB/gXRiVvGixQXvsR.91MDUEWbNUeCEnEt2fhg9mn8m/"; #1234
          isNormalUser = true;
          createHome = true;
          extraGroups = [ "wheel" ];
          group = "users";
          home = "/home/dev";
        };
      };
    };
}
