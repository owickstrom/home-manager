{
  config,
  lib,
  pkgs,
  ...
}:

let
  auto-dark-mode =
    let
      version = "e300259ec777a40b4b9e3c8e6ade203e78d15881";
    in
    pkgs.vimUtils.buildVimPlugin {
      inherit version;
      pname = "auto-dark-mode-nvim";
      src = pkgs.fetchFromGitHub {
        owner = "f-person";
        repo = "auto-dark-mode.nvim";
        rev = version;
        hash = "sha256-PhhOlq4byctWJ5rLe3cifImH56vR2+k3BZGDZdQvjng=";
      };
    };
in
{
  programs.neovim = {
    enable = true;
    vimAlias = true;
    vimdiffAlias = true;
    defaultEditor = true;
    plugins = with pkgs.vimPlugins; [
      auto-dark-mode
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
  };

  xdg.configFile."zls.json".text = ''
    {
      "enable_build_on_save": true
    }
  '';
}
