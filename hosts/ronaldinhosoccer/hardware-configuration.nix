{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  # Removendo módulos VFIO e v4l2loopback
  boot.initrd.availableKernelModules = ["xhci_pci" "ehci_pci" "nvme" "usb_storage" "usbhid" "sd_mod"];
  boot.initrd.kernelModules = [];
  boot.kernelParams = [
    "iommu=pt"
    "intel_iommu=on"
  ];

  boot.kernelModules = ["kvm-intel"];
  boot.extraModulePackages = [];

  # Configuração dos sistemas de arquivos Btrfs
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/d56336a7-79ed-4b73-8f59-a8a9b22fc676";
    fsType = "btrfs";
    options = ["subvol=rootfs"];
  };

  fileSystems."/.swapvol" = {
    device = "/dev/disk/by-uuid/d56336a7-79ed-4b73-8f59-a8a9b22fc676";
    fsType = "btrfs";
    options = ["subvol=swap"];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/9932-BD2F";
    fsType = "vfat";
    options = ["fmask=0022" "dmask=0022"];
  };

  fileSystems."/home" = {
    device = "/dev/disk/by-uuid/d56336a7-79ed-4b73-8f59-a8a9b22fc676";
    fsType = "btrfs";
    options = ["subvol=home"];
  };

  fileSystems."/nix" = {
    device = "/dev/disk/by-uuid/d56336a7-79ed-4b73-8f59-a8a9b22fc676";
    fsType = "btrfs";
    options = ["subvol=nix"];
  };

  fileSystems."/partition-root" = {
    device = "/dev/disk/by-uuid/d56336a7-79ed-4b73-8f59-a8a9b22fc676";
    fsType = "btrfs";
  };

  # Adicionando Swap
  swapDevices = [
    {
      device = "/swapfile";
      size = 4096; # Tamanho do swap em MB (4GB aqui, ajuste conforme necessário)
    }
  ];

  # Habilitando DHCP
  networking.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

  # Atualização de Microcódigo da Intel
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
