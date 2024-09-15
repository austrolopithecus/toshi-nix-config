{
  pkgs,
  nixvim,
  ...
}: {
  home.packages = with pkgs; [
    neovide
    ripgrep
    nixvim.packages.x86_64-linux.default
  ];
}
