# source system wide aliases
if [ -f /etc/zshrc ]; then
    source /etc/zshrc
fi

# emacs keybind
bindkey -e

# color
autoload -Uz colors && colors

# console style
autoload -Uz add-zsh-hook

## read common settings
#if [ -f ../zshrc ]; then
#    source ../zshrc
#fi

#PROMPT='%n@%m:%c$ '
PROMPT='%B%F{magenta}%n@%m:%c$%f%b '

if [ "`echo $TERM | grep 'screen'`" != "" ]; then
    function precmd_for_screen() {
        echo -ne "\033k\033\0134\033k$(basename $(pwd))\033\\"
    }
    add-zsh-hook precmd precmd_for_screen
fi

# default permission
umask 0022

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# zsh completion
if [ -e /usr/local/share/zsh-completions ]; then
    fpath=(/usr/local/share/zsh-completions $fpath)
fi

autoload -Uz compinit && compinit

#unsetopt auto_menu
setopt auto_list 

setopt auto_pushd
setopt correct
setopt print_eight_bit

export LS_COLORS='no=00:fi=00:di=01;36:ln=01;35:pi=40;33:so=01;33:bd=40;33;01:cd=40;33;01:or=40;33;01:ex=01;31:'
zstyle ':completion:*' list-colors "${LS_COLORS}"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# history
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups
setopt share_history 

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -l'
alias la='ls -aF'
alias sc='screen -D -RR'
alias lv='lv -Ou8'

export EDITOR='vi'
export SVN_SSH='ssh -q'

# OS-dependent settings
if [ "$(uname)" = 'Darwin' ]; then
    export LSCOLORS=gxfxcxdxbxegedabagacad
    alias ls='ls -G'

    # Homebrew PATH
    export PATH=/usr/local/bin:$PATH
    export PATH=/usr/include:$PATH
    
    alias Emacs='open -a /Applications/Emacs.app'
    alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
    alias gtkwave-app='open -a /Applications/gtkwave.app'
    
elif [ "$(uname)" = 'Linux' ]; then
    alias ls='ls --color=auto -NF --show-control-chars'

    # ssh-agent
    SSH_AGENT_FILE="${HOME}/.ssh/.ssh-agent.`hostname`"
    if [ -f ${SSH_AGENT_FILE} ]; then
        eval `cat ${SSH_AGENT_FILE}`
        ssh_agent_exist=0    
        for id in `ps ax|grep 'ssh-agent'|sed -e 's/\([0-9]\+\).*/\1/'`
        do 
            if [ ${SSH_AGENT_PID} = ${id} ]
            then 
                ssh_agent_exist=1
            fi
        done
        if [ $ssh_agent_exist = 0 ]
        then
            rm -f ${SSH_AGENT_FILE}
            ssh-agent > ${SSH_AGENT_FILE}
            chmod 600 ${SSH_AGENT_FILE}
            eval `cat ${SSH_AGENT_FILE}`
            ssh-add
        fi
    else
        ssh-agent > ${SSH_AGENT_FILE}
        chmod 600 ${SSH_AGENT_FILE}
        eval `cat ${SSH_AGENT_FILE}`
        ssh-add
    fi
fi
