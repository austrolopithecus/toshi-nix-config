{ lib, ... }: {

  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  networking.firewall.enable = lib.mkDefault false;
}
