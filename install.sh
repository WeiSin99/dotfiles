#!/bin/zsh

mkdir -p ~/.config/nvim/ftplugin
mkdir -p ~/.config/nvim/lua/user
mkdir -p ~/.config/nvim/lua/user/lsp
mkdir -p ~/.config/nvim/lua/user/lsp/settings

for f in `find ~/.config/nvim \( -iname \*.lua -o -iname \*.vim \)`; do
    rm -rf $f
done

for f in `find . \( -iname \*.lua -o -iname \*.vim \)`; do
    rm -rf ~/.config/nvim/$f
    ln -s ~/Desktop/dotfiles/$f ~/.config/nvim/$f
done
