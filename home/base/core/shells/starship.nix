{ pkgs, ... }: {
  programs.starship = {
    enable = true;
    package = pkgs.starship;
  };
  home.file.".config/starship.toml" = {

    source = ./starship.toml;
  };
}
