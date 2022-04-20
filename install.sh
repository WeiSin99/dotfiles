#!/bin/zsh

mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/ftplugin

for f in `find . \( -iname \*.lua -o -iname \*.vim \)`; do
    rm -rf ~/.config/nvim/$f
    ln -s ~/Desktop/dotfiles/$f ~/.config/nvim/$f
done
