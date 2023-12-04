# Johan's zsh config

#colors and prompt
autoload -U colors && colors
PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '

# history
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# autocompletion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) #show dotfiles
# use vim keys as navigation
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history 
bindkey -v '^?' backward-delete-char

# vi mode
bindkey -v
export KEYTIMEOUT=1
# cursors

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
#

# edit line in nvim with ctrl-e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# aliases, (probably should be in a different file)
alias ls='exa -al --no-user --no-time -h '
alias cd='z'
alias grep='grep --color=auto'
alias wifi='nmcli dev wifi connect'
alias wifilist='nmcli dev wifi list'
alias please='sudo $(fc -ln -1)'
alias gitui='gitui -t mocha.ron'

#default system variables
export VISUAL=nvim
export EDITOR=nvim
# export PATH="$HOME/.local/bin:$PATH"
source ~/.zshenv


# forward and backwords with ctrl
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# starship
eval "$(starship init zsh)"
# zoxide
eval "$(zoxide init zsh)"


# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
# colors for fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#1e1e2e,bg:#11111b,spinner:#f5e0dc,hl:#f9e2af \
--color=fg:#6c7086,header:#f38ba8,info:#45475a,pointer:#f5e0dc \
--color=fg+:#9399b2,prompt:#f5e0dc,hl+:#fab387 \
--prompt=' ' --color=prompt:#f5e0dc \
--pointer=' ' --color=pointer:#9399b2 \
--color=separator:#1e1e2e,scrollbar:#1e1e2e,query:#cdd6f4 \
--height 50% --layout=reverse \
--preview 'bat -n --color=always {}' \
--preview-window=right,60% \
--preview-window border-sharp --color=border:#1e1e2e \
--border=none "

export FZF_DEFAULT_COMMAND="rg --files --hidden -g '!.git/' -g '!*.cache/'"

export FZF_ALT_C_COMMAND='find .'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

source /home/johan/.config/broot/launcher/bash/br
