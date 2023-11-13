{ config, lib, pkgs, ... }:
let
    themes = (fetchTarball
      "https://github.com/alacritty/alacritty-theme/archive/808b81b2e88884e8eca5d951b89f54983fa6c237.tar.gz");
in
{
  xdg.configFile."alacritty/alacritty.yml".text = ''
import:
 - ${themes}/themes/challenger_deep.yaml

shell:
  program: /bin/zsh
  args: ["-l"]

window:
  decorations: none
  opacity: 0.95
  blur: true
  option_as_alt: Both
  padding:
    x: 8
    y: 8

scrolling:
  # Specifying '0' will disable scrolling.
  history: 100000
  # Number of lines the viewport will move for every line scrolled when
  # scrollback is enabled (history > 0).
  multiplier: 3

font:
  normal:
    family: JetBrains Mono
    style: Regular
  bold:
    family: JetBrains Mono
    style: Bold
  italic:
    family: JetBrains Mono
    style: Italic
  bold_italic:
    family: JetBrains Mono
    style: Bold Italic
  size: 13.0

#mouse:
#  url:
#    launcher:
#      # This depends on your OS, on Mac it’s `open`
#      program: open
#    modifiers: Command


key_bindings:
  - { key: Left,     mods: Alt,     chars: "\x1bb" }
  - { key: Right,    mods: Alt,     chars: "\x1bf" }
  '';
}
