{ config, pkgs, ... }:

{
    imports =
    [
        ./hardware-configuration.nix
    ];

    boot.loader.grub.device = "/dev/sda";
    services.openssh.enable = true;

    console = {
        keyMap = "de";
    }

    services.xserver.enable = true;
    services.xserver.xkb.layout = "de";
    users.users.dev = {
        extraGroups = [ "wheel" ];
    }
}
