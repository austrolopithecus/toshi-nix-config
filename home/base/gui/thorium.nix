{ pkgs, ... }: {
  home.packages = [
    (pkgs.callPackage ../../../pkgs/appimage/thorium.nix { })
  ];

}
