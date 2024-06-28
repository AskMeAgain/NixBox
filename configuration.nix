{ config, pkgs, lib, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ] ++ lib.optional (builtins.pathExists /home/dev/user.nix) [ /home/dev/user.nix ];

    boot.loader.grub.device = "/dev/sda";
    services.openssh.enable = true;

    console = {
        keyMap = "de";
    };

    services.xserver = {
        enable = true;
        xkb.layout = "de";
        layout = "de";
    };

    users.users.dev = {
        initialPassword = "1234";
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        mutableUsers  = true;
        
        home = "/home/dev";
        shell = pkgs.bash;
    };
}
