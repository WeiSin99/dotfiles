#!/bin/zsh

SCRIPT_DIR=$(dirname "$(realpath "$0")")


if [[ -d ~/.config/nvim ]]; then
  rm ~/.config/nvim
fi
ln -s "$SCRIPT_DIR/nvim" ~/.config/nvim

if [[ -d ~/.config/bat ]]; then
  rm ~/.config/bat
fi
ln -s "$SCRIPT_DIR/bat" ~/.config/bat

if [[ ! -d ~/.config/tmux ]]; then
  mkdir -p ~/.config/tmux
fi
if [[ -f ~/.config/tmux/tmux.conf ]]; then
  rm ~/.config/tmux/tmux.conf
fi
ln -s "$SCRIPT_DIR/scripts/tmux-sessionizer" ~/.local/bin/tmux-sessionizer

if [[ ! -d ~/.local/bin ]]; then
  mkdir -p ~/.local/bin
fi
if [[ -f ~/.local/bin/tmux-sessionizer ]]; then
  rm ~/.local/bin/tmux-sessionizer
fi
ln -s "$SCRIPT_DIR/scripts/tmux-sessionizer" ~/.local/bin/tmux-sessionizer

if [[ ! -d ~/.config/lazygit ]]; then
  mkdir -p ~/.config/lazygit
fi
if [[ -f ~/.config/lazygit/config.yml ]]; then
  rm ~/.config/lazygit/config.yml
fi
ln -s "$SCRIPT_DIR/lazygit/config.yml" ~/.config/lazygit/config.yml
