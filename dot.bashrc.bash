# if bash does not exist, return
[ "$BASH" = "" ] &&  return

if [ -z "$PS1" ]; then
    return
fi

# read system global settings
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# read common settings
if [ -f ../bashrc ]; then
    source ../bashrc
fi

function share_history {
    history -a
    history -c
    history -r
}

# screen style
if [ "`echo $TERM | grep 'screen'`" != "" ]; then
    ## PWD when no command is running, otherwise current command name as window name
    #export PS1='\u@\h:\W\$ '
    export PS1='\[\033[01;35m\]\u@\h:\W\$\[\033[00m\] '
    export PROMPT_COMMAND='echo -ne "\033k\033\0134\033k$(basename $(pwd))\033\\";share_history'
else
    #export PS1='\u@\h:\W\$ '
    export PS1='\[\033[01;35m\]\u@\h:\W\$\[\033[00m\] '
    export PROMPT_COMMAND='share_history'
fi

stty sane
if [ "$(stty | grep erase)" = "" ] ; then
    stty erase 
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export HISTCONTROL=ignoredups
export HISTIGNORE="cd*:pwd*:fg*:bg*"
export HISTSIZE=10000

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
if [ "$(uname)" == 'Darwin' ]; then
    export LSCOLORS=gxfxcxdxbxegedabagacad
    alias ls='ls -G'

    # bash completion
    if [ -f /usr/local/etc/bash_completion ]; then
        source /usr/local/etc/bash_completion
    fi

    # Homebrew PATH
    export PATH=/usr/local/bin:$PATH
    export PATH=/usr/include:$PATH
    
    alias Emacs='open -a /Applications/Emacs.app'
    alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
    alias gtkwave-app='open -a /Applications/gtkwave.app'
    
elif [ "$(uname)" == 'Linux' ]; then
    LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.i386.rpm=01;31:*.src.rpm=01;30:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:' ; export LS_COLORS
    alias ls='ls --color=auto -NF --show-control-chars'

    # bash completion
    if [ -f /etc/bash_completion ]; then
        source /etc/bash_completion
    fi
    
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
