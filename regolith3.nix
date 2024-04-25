{ config, lib, pkgs, ... }: {
  xdg.configFile."regolith3/Xresources".text = ''
    regolith.wallpaper.file: ${./space.jpeg}
    regolith.wallpaper.color.primary: white
    gnome.terminal.font: JetBrains Mono 12
    gtk.theme_name: Ayu-Dark

    org.gnome.desktop.interface.color-scheme: prefer-dark

    regolith.look.path: /usr/share/regolith-look/gruvbox
  '';
}

