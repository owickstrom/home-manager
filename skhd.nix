{
  config,
  lib,
  pkgs,
  ...
}:
{
  xdg.configFile."skhd/skhdrc".text = ''
    alt + shift - e : yabai -m space --layout bsp
    alt + shift - s : yabai -m space --layout stack
    alt + shift - r : yabai -m space --rotate 90

    alt + shift - j : yabai -m window --focus stack.next || yabai -m window --focus south
    alt + shift - k : yabai -m window --focus stack.prev || yabai -m window --focus north
    alt + shift - h : yabai -m window --focus west
    alt + shift - l : yabai -m window --focus east

    ctrl + alt + shift - j : yabai -m window --swap stack.next || yabai -m window --swap south
    ctrl + alt + shift - k : yabai -m window --swap stack.prev || yabai -m window --swap north
    ctrl + alt + shift - h : yabai -m window --swap west
    ctrl + alt + shift - l : yabai -m window --swap east

    alt + shift - 1 : yabai -m space --focus 1
    alt + shift - 2 : yabai -m space --focus 2
    alt + shift - 3 : yabai -m space --focus 3
    alt + shift - 4 : yabai -m space --focus 4
    alt + shift - 5 : yabai -m space --focus 5
    alt + shift - 6 : yabai -m space --focus 6

    ctrl + alt + shift - 1 : yabai -m window --space 1
    ctrl + alt + shift - 2 : yabai -m window --space 2
    ctrl + alt + shift - 3 : yabai -m window --space 3
    ctrl + alt + shift - 4 : yabai -m window --space 4
    ctrl + alt + shift - 5 : yabai -m window --space 5
    ctrl + alt + shift - 6 : yabai -m window --space 6

    alt + shift - f : yabai -m window --toggle native-fullscreen
    ctrl + alt + shift - f : yabai -m window --toggle float

    ctrl + alt + shift - f : yabai -m window --toggle float

    alt + shift - return : open -n -a /Applications/Ghostty.app
  '';
}
