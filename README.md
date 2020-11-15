# My Nix Home-Manager Setup

To set up:

```
nix-env -i git
git clone git@github.com:owickstrom/nix-home.git ~/.config/nixpkgs
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update home-manager
nix-shell '<home-manager>' -A install
```

## Update VSCode Extensions

```
curl https://raw.githubusercontent.com/NixOS/nixpkgs/42d815d1026e57f7e6f178de5a280c14f7aba1a5/pkgs/misc/vscode-extensions/update_installed_exts.sh  | bash > $HOME/.config/nixpkgs/vscode-extensions.nix
```
