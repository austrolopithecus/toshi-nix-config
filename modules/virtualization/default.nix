{
  config,
  pkgs,
  ...
}: {
  # Pacotes instalados no sistema
  environment.systemPackages = with pkgs; [
    virt-manager
    qemu_kvm
    qemu
    ovmf # Nome correto do pacote OVMF
  ];

  # Habilita o libvirtd
  virtualisation.libvirtd = {
    enable = true;
    group = "libvirtd"; # Permite usuários no grupo 'libvirtd' usarem o serviço
  };

  # Habilita QEMU/KVM com rede padrão
  virtualisation.qemu = {
    enable = true;
    defaultNetwork = true;
  };

  # Outras configurações...
}
