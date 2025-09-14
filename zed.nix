{
  config,
  lib,
  pkgs,
  ...
}:
{
  xdg.configFile."zed/settings.json".source = config.lib.file.mkOutOfStoreSymlink ./zed/settings.json;
  xdg.configFile."zed/keymap.json".source = config.lib.file.mkOutOfStoreSymlink ./zed/keymap.json;
}
