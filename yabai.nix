{ config, lib, pkgs, ... }: {
  xdg.configFile."yabai/yabairc" = {
    executable = true;
    text = ''
      # the scripting-addition must be loaded manually if
      # you are running yabai on macOS Big Sur. Uncomment
      # the following line to have the injection performed
      # when the config is executed during startup.
      #
      # for this to work you must configure sudo such that
      # it will be able to run the command without password

      sudo yabai --load-sa
      yabai -m signal --add event=dock_did_restart action="sudo yabai --load-sa"

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
  };
}
