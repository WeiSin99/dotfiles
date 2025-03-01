#!/bin/zsh

SCRIPT_DIR=$(dirname "$(realpath "$0")")

create_symlink() {
  local src=$1
  local target=$2

  if [[ -L $target || -f $target || -d $target ]]; then
    rm -rf "$target"  # Remove existing file, directory, or symlink
  fi

  ln -s "$src" "$target"
}

ensure_directory() {
  local dir=$1

  [[ ! -d $dir ]] && mkdir -p "$dir"
}

ensure_directory "$HOME/.local/bin"
ensure_directory "$HOME/.config/tmux"
ensure_directory "$HOME/.config/lazygit"

create_symlink "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
create_symlink "$SCRIPT_DIR/nvim" "$HOME/.config/nvim"
create_symlink "$SCRIPT_DIR/bat" "$HOME/.config/bat"
create_symlink "$SCRIPT_DIR/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
create_symlink "$SCRIPT_DIR/scripts/tmux-sessionizer" "$HOME/.local/bin/tmux-sessionizer"
create_symlink "$SCRIPT_DIR/lazygit/config.yml" "$HOME/.config/lazygit/config.yml"

