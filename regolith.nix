{ config, pkgs, ... }:
let
  theme = pkgs.writeShellScriptBin "theme" ''
    if [ $# -ne 1 ]; then
        echo "Usage: $0 (light|dark)"
        exit 1
    fi

    case "$1" in
        light)
            gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
            gsettings set org.gnome.desktop.interface color-scheme "prefer-light"
            regolith-look set ayu
            echo "Switched to light theme"
            ;;
        dark)
            gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
            gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
            regolith-look set ayu-dark
            echo "Switched to dark theme"
            ;;
        *)
            echo "Invalid argument. Use 'light' or 'dark'"
            exit 1
            ;;
    esac
  '';
in
{
  home.packages = with pkgs; [
    theme
  ];

  xdg.configFile."regolith3/Xresources".source =
    config.lib.file.mkOutOfStoreSymlink ./regolith/Xresources;
  xdg.configFile."regolith3/i3xrocks/conf.d".source =
    config.lib.file.mkOutOfStoreSymlink "/usr/share/i3xrocks/conf.d";
}
