{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      # lsp/langs
      nvim-lspconfig
      (nvim-treesitter.withPlugins (p: [
        p.bash
        p.go
        p.java
        p.json
        p.lua
        p.markdown
        p.nix
        p.python
        p.rust
        p.zig
        p.vimdoc
        p.graphql
      ]))
      nvim-jdtls
      # git
      neogit
      gitlinker-nvim
      # other
      conform-nvim
      fzf-lua
      zenbones-nvim
      goyo
      copilot-lua
      CopilotChat-nvim
    ];
    extraConfig = ''
      source /home/owi/.config/home-manager/vim/init.vim
    '';
    extraPackages = with pkgs; [
      lua-language-server
      jdt-language-server
    ];
    extraWrapperArgs = [
      "--add-flags"
      "--listen /tmp/$RANDOM.nvim.pipe"
    ];
  };

  xdg.configFile."zls.json".text = ''
    {
      "enable_build_on_save": true
    }
  '';
}
