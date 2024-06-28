{ config, pkgs, ... }:

{
    imports =
    [
        ./hardware-configuration.nix
    ];

    boot.loader.grub.device = "/dev/sda";
    services.openssh.enable = true;


    users.users.user

    console = {
        keyMap = "de";
    }

    services.xserver.enable = true;
    services.xserver.xkb.layout = "de";
    users.users.dev = {
        extraGroups = [ "wheel" ];
    }
}
