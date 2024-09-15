{ pkgs
, config
, lib
, anyrun
, ...
} @ args:
{
  imports = [ ./values ];
  home.file.".config/hypr" = {
    source = ./conf;
    recursive = true;
  };

}
