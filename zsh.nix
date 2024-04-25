{ config, lib, pkgs, ... }: {
  programs.fzf.enable = true;
  programs.zsh = {
    defaultKeymap = "emacs";
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    autocd = true;
    shellAliases = {
      ll = "ls -l";
      lla = "ls -la";
      g = "git";
      gs = "echo No.";
      e = "eval $EDITOR";
      ec = "emacsclient -nc";
      copy-to-clipboard = "xclip -selection clipboard";
    };
    envExtra = ''
      # Nix
      if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      fi
      # End Nix
    '';
    initExtra = ''
      # For home-manager
      export NIX_PATH=$HOME/.nix-defexpr/channels''${NIX_PATH:+:}$NIX_PATH

      if [ -f $HOME/.cargo/env ]; then source $HOME/.cargo/env; fi

      eval "$(direnv hook zsh)"
    '';
    profileExtra = ''
      export XDG_DATA_DIRS=$HOME/.nix-profile/share:/usr/local/share:/usr/share

      [ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"

      export PATH=$PATH:$HOME/.local/bin

      # If you need to have llvm first in your PATH, run:
      export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
      export PATH="$HOME/.cargo/bin:$PATH"

      # For compilers to find llvm you may need to set:
      export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
      export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
      export EDITOR="vim"
      export VISUAL="vim"
    '';

    prezto = {
      enable = true;
      prompt = {
        pwdLength = "short";
        theme = "minimal";
      };
    };
  };

  programs.autojump.enable = true;
}
