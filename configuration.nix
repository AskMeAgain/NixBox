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

    users.users.root.initialHashedPassword = "$6$my5Sq4TJgI7IVyva$BjnCcQP9zEdYrtYKW7J7X7cpV5VR3jw.2zF/BR16T5506qDpB0QKyH2fEm08qt84u1xvk.tnR8I06/lF6IpnC1"; #1234
    users.users.dev = {
        initialHashedPassword = "$6$my5Sq4TJgI7IVyva$BjnCcQP9zEdYrtYKW7J7X7cpV5VR3jw.2zF/BR16T5506qDpB0QKyH2fEm08qt84u1xvk.tnR8I06/lF6IpnC1"; #1234
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        
        home = "/home/dev";
        shell = pkgs.bash;
    };
}
