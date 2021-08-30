{ config, lib, pkgs, ... }: {
  xdg.configFile."yabai/yabairc".text = ''
    yabai -m config debug_output on
    yabai -m config layout bsp

    yabai -m config top_padding    4
    yabai -m config bottom_padding 4
    yabai -m config left_padding   4
    yabai -m config right_padding  4
    yabai -m config window_gap     4

    yabai -m config mouse_modifier ctrl
    yabai -m config mouse_action1 move
    yabai -m config mouse_action2 resize

    yabai -m space --layout bsp

    yabai -m rule --add app=Emacs manage=on
    yabai -m rule --add app="^System Preferences$" manage=off
  '';
}
