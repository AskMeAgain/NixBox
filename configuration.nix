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

    users = {
      mutableUsers = true;
      users = {
        root = {
          initialHashedPassword = "$6$jUFVxfhcAsgEMI6q$L/hHdbPClSqJCbDuCor4vqkX8U37vJthK4dRaSqAxkcB/gXRiVvGixQXvsR.91MDUEWbNUeCEnEt2fhg9mn8m/"; #1234
        };
        dev = {
          initialHashedPassword = "$6$jUFVxfhcAsgEMI6q$L/hHdbPClSqJCbDuCor4vqkX8U37vJthK4dRaSqAxkcB/gXRiVvGixQXvsR.91MDUEWbNUeCEnEt2fhg9mn8m/"; #1234
          isNormalUser = true;
          extraGroups = [ "wheel" ];
          home = "/home/dev";
        };
      };
    };
}
