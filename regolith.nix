{ config, pkgs, ... }:
let
  theme = pkgs.writeShellScriptBin "theme" ''
    if [ $# -ne 1 ]; then
        echo "Usage: $0 (light|dark)"
        exit 1
    fi

    case "$1" in
        light)
            gsettings set org.gnome.desktop.interface gtk-theme "Adwaita" &> /dev/null
            gsettings set org.gnome.desktop.interface color-scheme "prefer-light" &> /dev/null
            sed -i 's/ayu-dark$/ayu/' ~/.config/home-manager/regolith/Xresources
            sed -i 's/Dark/Light/' ~/.config/home-manager/ghostty/config
            sed -i 's/bg=dark/bg=light/' ~/.config/home-manager/vim/init.vim
            ;;
        dark)
            gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark" &> /dev/null
            gsettings set org.gnome.desktop.interface color-scheme "prefer-dark" &> /dev/null
            sed -i 's/ayu$/ayu-dark/' ~/.config/home-manager/regolith/Xresources
            sed -i 's/Light/Dark/' ~/.config/home-manager/ghostty/config
            sed -i 's/bg=light/bg=dark/' ~/.config/home-manager/vim/init.vim
            ;;
        *)
            echo "Invalid argument. Use 'light' or 'dark'"
            exit 1
            ;;
    esac

    # Reload themes in Regolith, Ghostty, and any open Neovim instances.
    killall -SIGUSR2 ghostty
    for addr in /tmp/*.nvim.pipe; do
        nvim --server $addr --remote-send ":set bg=$1<CR>"
    done
    regolith-look refresh &> /dev/null

    echo "Switched to $1 theme"
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
