#!/bin/zsh

mkdir -p ~/.config/nvim/lua/user

for f in `find ~/.config/nvim \( -iname \*.lua -o -iname \*.vim \)`; do
    rm -rf $f
done

for f in `find . \( -iname \*.lua -o -iname \*.vim \)`; do
    rm -rf ~/.config/nvim/$f
    ln -s ~/Desktop/dotfiles/$f ~/.config/nvim/$f
done
