export XDG_CONFIG_HOME="$HOME/.config"

# fzf
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="--border"
export FZF_DEFAULT_COMMAND="fd --type file --hidden --follow --exclude .git --exclude node_modules"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --preview-window 'border-left'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_ALT_C_COMMAND="fd --type directory --hidden --follow --exclude .git --exclude node_modules"

# Use fd to generate the list for path and directory completion
export FZF_COMPLETION_PATH_OPTS="--preview 'bat -n --color=always {}'"
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" --exclude "node_modules" . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" --exclude "node_modules" . "$1"
}

# changing fzf default ALT_C keybinding
bindkey -r '\ec'
# changing fzf ALT_C keybinding
bindkey '^G' fzf-cd-widget

bindkey -s '^f' 'tmux-sessionizer\n'

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(starship init zsh)"

