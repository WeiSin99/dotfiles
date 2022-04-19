#!/bin/zsh
for f in `find . \( -iname \*.lua -o -iname \*.vim \)`; do
    rm -rf ~/.config/nvim/$f
    ln -s ~/Desktop/dotfiles/$f ~/.config/nvim/$f
done
