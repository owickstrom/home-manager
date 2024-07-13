{
  config,
  lib,
  pkgs,
  ...
}:
{
  xdg.configFile."bat/config".text = ''
    --theme=ansi
    --italic-text=always
  '';
}

