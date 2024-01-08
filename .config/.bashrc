#~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -a --color=auto'
alias grep='grep --color=auto'
alias wifi='nmcli dev wifi connect'
alias wifilist='nmcli dev wifi list'
alias please='sudo $(fc -ln -1)'

#PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
#. "$HOME/.cargo/env"
#
export PATH="$HOME/bin:$PATH"
export RUSTC_WRAPPER="$HOME/.cargo/bin/sccache"
#color and style generator
function C() {
    local style=$2
    declare -A color 

    color["K"]="30" 
    color["R"]="31" 
    color["G"]="32" 
    color["Y"]="33" 
    color["B"]="34" 
    color["M"]="35" 
    color["C"]="36" 
    color["W"]="37" 
    echo "\[\033[${style};${color[$1]}m\]"
};

cd ~
