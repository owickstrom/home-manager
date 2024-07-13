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
      "${themes}/themes/base16_default_dark.toml"
    ]

    [font]
    size = 12.0

    [font.bold]
    family = "JetBrainsMono Nerd Font"
    style = "Bold"

    [font.bold_italic]
    family = "JetBrainsMono Nerd Font"
    style = "Bold Italic"

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

    [scrolling]
    history = 100000
    multiplier = 3

    [shell]
    args = ["-l"]
    program = "${pkgs.zsh}/bin/zsh"

    [window]
    blur = true
    decorations = "None"
    opacity = 1
    # option_as_alt = "Both"

    [window.padding]
    x = 8
    y = 8
  '';
}
