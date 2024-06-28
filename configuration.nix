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

    users.mutableUsers = true;

    users.users.root.initialPassword = "root";
    users.users.dev = {
        initialHashedPassword = "$1$SaltSalt$9L0pb/SqzBFEMEccQY0sC/"; #1234
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        
        home = "/home/dev";
        shell = pkgs.bash;
    };
}
