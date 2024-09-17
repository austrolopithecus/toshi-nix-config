{pkgs, ...}: {
  users.users.toshi = {
    isNormalUser = true;
    extraGroups = ["wheel" "libvirtd"]; # Enable ‘sudo’ for the user.
    shell = pkgs.nushell;
  };
}
