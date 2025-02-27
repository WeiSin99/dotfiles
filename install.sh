#!/bin/zsh

SCRIPT_DIR=$(dirname "$(realpath "$0")")

ln -s "$SCRIPT_DIR/nvim" ~/.config/nvim
ln -s "$SCRIPT_DIR/scripts/tmux-sessionizer" ~/.local/bin
