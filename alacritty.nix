{
  config,
  lib,
  pkgs,
  ...
}:
let
  themes = (
    fetchTarball "https://github.com/alacritty/alacritty-theme/archive/cb786242b6f5e00a57e2f541e7bf1115f3950650.tar.gz"
  );
in
{
  xdg.configFile."alacritty/alacritty.toml".text = ''

    import = [
      "${themes}/themes/atom_one_light.toml"
    ]

    [font]
    size = 10.0
    offset.y = 5

    [font.bold]
    family = "JetBrainsMono Nerd Font"
    style = "ExtraBold"

    [font.bold_italic]
    family = "JetBrainsMono Nerd Font"
    style = "ExtraBold Italic"

    [font.italic]
    family = "JetBrainsMono Nerd Font"
    style = "Italic"

    [font.normal]
    family = "JetBrainsMono Nerd Font"
    style = "Medium"

    [[keyboard.bindings]]
    chars = "\u001Bb"
    key = "Left"
    mods = "Alt"

    [[keyboard.bindings]]
    chars = "\u001Bf"
    key = "Right"
    mods = "Alt"

    [[keyboard.bindings]]
    key = "F11"
    action = "ToggleFullscreen"

    [scrolling]
    history = 100000
    multiplier = 3

    [shell]
    args = ["-l"]
    program = "${pkgs.zsh}/bin/zsh"

    [window]
    blur = true
    decorations = "Full"
    opacity = 1
    # option_as_alt = "Both"

    [window.padding]
    x = 8
    y = 8
  '';
}
