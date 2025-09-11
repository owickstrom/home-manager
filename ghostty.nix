{
  config,
  lib,
  pkgs,
  ...
}:
{
  xdg.configFile."ghostty/config".source = config.lib.file.mkOutOfStoreSymlink ./ghostty/config;
}
