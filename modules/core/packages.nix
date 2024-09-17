{
  pkgs,
  ...
}: {
  imports = [
  ];

  hardware.ledger.enable = true;
  environment.systemPackages = with pkgs; [
    wget
    git
    killall
    sbctl
  ];
}
