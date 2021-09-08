# My Nix Home-Manager Setup

To set up:

```
nix-env -i git
git clone git@github.com:owickstrom/nix-home.git ~/.config/nixpkgs
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update home-manager
nix-shell '<home-manager>' -A install
```
