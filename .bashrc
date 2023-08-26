
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias wifi='nmcli dev wifi connect'
alias wifilist='nmcli dev wifi list'
#PS1='[\u@\h \W]\$ '

#eval "$(starship init bash)"
#. "$HOME/.cargo/env"
#export PATH="$HOME/bin:$PATH"

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


function make_prompt
{
    local RESET="\[\033[0m\]"

    if [ "`id -u`" -eq 0 ]; then
        PS1="$RESET|$(C B 1)\D{%Y.%m.%d}$RESET|$(C G 1)[\w]
$RESET|$(C R 1)\$$RESET|$(C Y 0)\t$RESET|$(C W 1)\u\
$(C W 2)@$RESET$(C M 1)\h$(C K 1):$RESET"
    else
        PS1="$RESET|$(C B 1)\D{%Y.%m.%d}$RESET|$(C G 1)[\w]
$RESET|$(C K 1)\$$RESET|$(C Y 0)\t$RESET|$(C W 1)\u\
$(C W 2)@$RESET$(C M 1)\h$(C K 1):$RESET"
    fi
}

make_prompt
# default path

cd ~
