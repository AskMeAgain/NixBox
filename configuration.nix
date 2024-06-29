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
        useXkbConfig = true;
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

    users = {
      mutableUsers = true;
      users = {
        root = {
          initialHashedPassword = "$5$2hwspBev0lJ.XFxs$tPnpwwudzLcJqh9e3DntbCrQOz3LUgmrmBKnBW8clz6"; #1234
        };
        dev = {
          initialHashedPassword = "$5$2hwspBev0lJ.XFxs$tPnpwwudzLcJqh9e3DntbCrQOz3LUgmrmBKnBW8clz6"; #1234
          isNormalUser = true;
          createHome = true;
          extraGroups = [ "wheel" ];
          group = "users";
          home = "/home/dev";
        };
      };
    };
}
