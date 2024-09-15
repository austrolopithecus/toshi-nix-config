{
  pkgs,
  agenix,
  ...
}: {
  imports = [
    agenix.nixosModules.default
  ];

  hardware.ledger.enable = true;
  environment.systemPackages = with pkgs; [
    wget
    agenix.packages.x86_64-linux.default
    git
    killall
    sbctl
  ];
}
