{
  config,
  lib,
  pkgs,
  ...
}:
{
  # Based off `ghostty +show-config --default --docs`
  xdg.configFile."ghostty/config".text = ''
    font-family = JetBrainsMono Nerd Font Mono
    font-style = Medium
    font-size = 15
    font-thicken = true

    theme = zenbones
    selection-invert-fg-bg = false
    minimum-contrast = 3

    cursor-color = 
    cursor-opacity = 1
    cursor-style = block
    cursor-style-blink = 
    cursor-click-to-move = true

    mouse-hide-while-typing = false
    mouse-shift-capture = false
    mouse-scroll-multiplier = 1

    background-opacity = 1
    background-blur-radius = 0
    unfocused-split-opacity = 0.6

    # The color to dim the unfocused split. Unfocused splits are dimmed by
    # rendering a semi-transparent rectangle over the split. This sets the color of
    # that rectangle and can be used to carefully control the dimming effect.
    # 
    # This will default to the background color.
    unfocused-split-fill = 
    command = zsh -l

    wait-after-command = false
    # in bytes:
    scrollback-limit = 10000000
    link-url = true
    fullscreen = false
    title = 
    working-directory = home

    # Key bindings. The format is `trigger=action`. Duplicate triggers will
    # overwrite previously set values.
    # 
    # Trigger: `+`-separated list of keys and modifiers. Example: `ctrl+a`,
    # `ctrl+shift+b`, `up`. Some notes:
    # 
    #   * modifiers cannot repeat, `ctrl+ctrl+a` is invalid.
    # 
    #   * modifiers and keys can be in any order, `shift+a+ctrl` is *weird*,
    #     but valid.
    # 
    #   * only a single key input is allowed, `ctrl+a+b` is invalid.
    # 
    # Valid modifiers are `shift`, `ctrl` (alias: `control`), `alt` (alias: `opt`,
    # `option`), and `super` (alias: `cmd`, `command`). You may use the modifier
    # or the alias. When debugging keybinds, the non-aliased modifier will always
    # be used in output.
    # 
    # Action is the action to take when the trigger is satisfied. It takes the
    # format `action` or `action:param`. The latter form is only valid if the
    # action requires a parameter.
    # 
    #   * `ignore` - Do nothing, ignore the key input. This can be used to
    #     black hole certain inputs to have no effect.
    # 
    #   * `unbind` - Remove the binding. This makes it so the previous action
    #     is removed, and the key will be sent through to the child command
    #     if it is printable.
    # 
    #   * `csi:text` - Send a CSI sequence. i.e. `csi:A` sends "cursor up".
    # 
    #   * `esc:text` - Send an escape sequence. i.e. `esc:d` deletes to the
    #     end of the word to the right.
    # 
    #   * `text:text` - Send a string. Uses Zig string literal syntax.
    #     i.e. `text:\x15` sends Ctrl-U.
    # 
    # Some notes for the action:
    # 
    #   * The parameter is taken as-is after the `:`. Double quotes or
    #     other mechanisms are included and NOT parsed. If you want to
    #     send a string value that includes spaces, wrap the entire
    #     trigger/action in double quotes. Example: `--keybind="up=csi:A B"`
    # 
    # There are some additional special values that can be specified for
    # keybind:
    # 
    #   * `keybind=clear` will clear all set keybindings. Warning: this
    #     removes ALL keybindings up to this point, including the default
    #     keybindings.
    keybind = super+page_up=scroll_page_up
    keybind = super+shift+up=jump_to_prompt:-1
    keybind = super+physical:four=goto_tab:4
    keybind = super+comma=open_config
    keybind = super+shift+comma=reload_config
    keybind = super+minus=decrease_font_size:1
    keybind = super+a=select_all
    keybind = super+shift+down=jump_to_prompt:1
    keybind = super+w=close_surface
    keybind = super+shift+w=close_window
    keybind = super+shift+left_bracket=previous_tab
    keybind = super+shift+enter=toggle_split_zoom
    keybind = super+alt+down=goto_split:bottom
    keybind = alt+shift+equal=equalize_splits
    keybind = super+physical:eight=goto_tab:8
    keybind = super+alt+right=goto_split:right
    keybind = super+ctrl+right=resize_split:right,10
    keybind = super+n=new_window
    keybind = super+enter=toggle_fullscreen
    keybind = super+alt+i=inspector:toggle
    keybind = super+ctrl+f=toggle_fullscreen
    keybind = super+alt+left=goto_split:left
    keybind = super+page_down=scroll_page_down
    keybind = super+alt+shift+w=close_all_windows
    keybind = super+alt+up=goto_split:top
    keybind = super+t=new_tab
    keybind = super+c=copy_to_clipboard
    keybind = super+shift+right_bracket=next_tab
    keybind = super+physical:one=goto_tab:1
    keybind = super+physical:nine=goto_tab:9
    keybind = super+left_bracket=goto_split:previous
    keybind = super+equal=increase_font_size:1
    keybind = super+physical:three=goto_tab:3
    keybind = super+end=scroll_to_bottom
    keybind = super+right_bracket=goto_split:next
    keybind = super+d=new_split:right
    keybind = super+shift+j=write_scrollback_file
    keybind = super+q=quit
    keybind = super+plus=increase_font_size:1
    keybind = super+zero=reset_font_size
    keybind = super+physical:five=goto_tab:5
    keybind = super+home=scroll_to_top
    keybind = super+physical:seven=goto_tab:7
    keybind = super+shift+d=new_split:down
    keybind = super+ctrl+down=resize_split:down,10
    keybind = super+ctrl+left=resize_split:left,10
    keybind = super+k=clear_screen
    keybind = super+ctrl+up=resize_split:up,10
    keybind = super+physical:two=goto_tab:2
    keybind = super+physical:six=goto_tab:6
    keybind = super+v=paste_from_clipboard

    window-padding-x = 5
    window-padding-y = 5
    window-padding-balance = true
    window-vsync = true
    window-inherit-working-directory = true
    window-inherit-font-size = true

    window-decoration = true
    window-title-font-family = 
    window-theme = auto
    window-save-state = default
    window-new-tab-position = current

    focus-follows-mouse = false
    gtk-titlebar = true

    # Whether to allow programs running in the terminal to read/write to the
    # system clipboard (OSC 52, for googling). The default is to allow clipboard
    # reading after prompting the user and allow writing unconditionally.
    clipboard-read = ask

    clipboard-write = allow
    # Trims trailing whitespace on data that is copied to the clipboard. This does
    # not affect data sent to the clipboard via `clipboard-write`.
    clipboard-trim-trailing-spaces = true

    # Require confirmation before pasting text that appears unsafe. This helps
    # prevent a "copy/paste attack" where a user may accidentally execute unsafe
    # commands by pasting text with newlines.
    clipboard-paste-protection = true

    # If true, bracketed pastes will be considered safe. By default, bracketed
    # pastes are considered safe. "Bracketed" pastes are pastes while the running
    # program has bracketed paste mode enabled (a setting set by the running
    # program, not the terminal emulator).
    clipboard-paste-bracketed-safe = true

    # The total amount of bytes that can be used for image data (i.e. the Kitty
    # image protocol) per terminal scren. The maximum value is 4,294,967,295
    # (4GiB). The default is 320MB. If this is set to zero, then all image
    # protocols will be disabled.
    # 
    # This value is separate for primary and alternate screens so the effective
    # limit per surface is double.
    image-storage-limit = 320000000

    # Whether to automatically copy selected text to the clipboard. `true` will
    # only copy on systems that support a selection clipboard.
    # 
    # The value `clipboard` will copy to the system clipboard, making this work on
    # macOS. Note that middle-click will also paste from the system clipboard in
    # this case.
    # 
    # Note that if this is disabled, middle-click paste will also be disabled.
    copy-on-select = true

    # The time in milliseconds between clicks to consider a click a repeat
    # (double, triple, etc.) or an entirely new single click. A value of zero will
    # use a platform-specific default. The default on macOS is determined by the
    # OS settings. On every other platform it is 500ms.
    click-repeat-interval = 0

    # Additional configuration files to read. This configuration can be repeated
    # to read multiple configuration files. Configuration files themselves can
    # load more configuration files. Paths are relative to the file containing the
    # `config-file` directive. For command-line arguments, paths are relative to
    # the current working directory.
    # 
    # Cycles are not allowed. If a cycle is detected, an error will be logged and
    # the configuration file will be ignored.
    config-file = 

    # Confirms that a surface should be closed before closing it. This defaults to
    # true. If set to false, surfaces will close without any confirmation.
    confirm-close-surface = true

    # Whether or not to quit after the last window is closed. This defaults to
    # false. Currently only supported on macOS. On Linux, the process always exits
    # after the last window is closed.
    quit-after-last-window-closed = false

    shell-integration = zsh
    shell-integration-features = no-cursor,no-sudo,no-title

    custom-shader-animation = false
    macos-non-native-fullscreen = false

    macos-titlebar-style = transparent
    macos-option-as-alt = true
    macos-window-shadow = true

    gtk-single-instance = desktop
    gtk-tabs-location = top
    gtk-wide-tabs = true

    gtk-adwaita = true

    desktop-notifications = true
    bold-is-bright = false

    term = xterm-ghostty
  '';
}
