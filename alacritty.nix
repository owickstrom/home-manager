{
  config,
  lib,
  pkgs,
  ...
}:
let
  themes = (
    fetchTarball "https://github.com/alacritty/alacritty-theme/archive/40e0c6c8690d1c62f58718fcef8a48eb6077740b.tar.gz"
  );
in
{
  xdg.configFile."alacritty/alacritty.toml".text = ''

    [general]
    import = [
      "${themes}/themes/kanagawa_wave.toml"
    ]

    [font]
    size = 9.0
    offset.y = 8

    [font.bold]
    family = "TX-02"
    style = "SemiCondensed ExtraBold"

    [font.bold_italic]
    family = "TX-02"
    style = "SemiCondensed ExtraBold Italic"

    [font.italic]
    family = "TX-02"
    style = "SemiCondensed Italic"

    [font.normal]
    family = "TX-02"
    style = "SemiCondensed Medium"

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

    [terminal.shell]
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
