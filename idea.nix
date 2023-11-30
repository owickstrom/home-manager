{ config, pkgs, ... }:
let
  launcher = pkgs.writeShellScriptBin "idea" ''
    open -na "IntelliJ IDEA.app" --args "$@"
  '';
in {
  home.packages = with pkgs; [
    launcher
  ];

  home.file.".ideavimrc".text = ''
    nnoremap zC :action CollapseRegionRecursively<CR>
    nnoremap zO :action ExpandRegionRecursively<CR>
  '';

}
