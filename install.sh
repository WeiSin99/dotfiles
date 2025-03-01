#!/bin/zsh

SCRIPT_DIR=$(dirname "$(realpath "$0")")

rm ~/.config/nvim
ln -s "$SCRIPT_DIR/nvim" ~/.config/nvim

rm ~/.config/bat
ln -s "$SCRIPT_DIR/bat" ~/.config/bat

rm ~/.local/bin/tmux-sessionizer
ln -s "$SCRIPT_DIR/scripts/tmux-sessionizer" ~/.local/bin/tmux-sessionizer

rm ~/.config/lazygit/config.yml
ln -s "$SCRIPT_DIR/lazygit/config.yml" ~/.config/lazygit/config.yml
