{
  # NOTE: the args not used in this file CAN NOT be removed!
  # because haumea pass argument lazily,
  # and these arguments are used in the functions like `mylib.nixosSystem`, `mylib.colmenaSystem`, etc.
  inputs,
  lib,
  myvars,
  mylib,
  system,
  genSpecialArgs,
  ...
} @ args: let
  name = "ronaldinhosoccer";
  base-modules = {
    nixos-modules = map mylib.relativeToRoot [
      # common
      "modules/core"
      "modules/virtualization"
      "modules/hyprland"
      "modules/desktop"
      "modules/gaming"
      # host specific
      "hosts/ronaldinhosoccer"
    ];
    home-modules = map mylib.relativeToRoot [
      "home/base/home.nix"
      "home/base/tui.nix"
      "home/linux/gui/hyprland"
      "home/base/gui.nix"
    ];
  };
in {
  nixosConfigurations.${name} = mylib.nixosSystem (base-modules // args);
  #
  # colmena.${name} =
  #   mylib.colmenaSystem (base-modules // args // {inherit tags ssh-user;});
}
