{ config, lib, pkgs, ... }: {
  xdg.configFile."regolith/Xresources".text = ''
    i3-wm.gaps.inner.size: 0
  '';
}
