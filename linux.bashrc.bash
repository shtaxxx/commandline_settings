# If bash does not exist, return
[ "$BASH" = "" ] &&  return

if [ -z "$PS1" ]; then
    return
fi

# source system wide aliases
if [ -f /etc/bashrc ]; then
    source /etc/bashrc
fi

# console style
if [ "`echo $TERM | grep 'screen'`" != "" ]; then
    ## Current command name as window name
    #export PS1='\[\033k\033\\\][\u@\h \W]\$ '
    #export PS1='\[\033k\033\\\]\u@\h:\W\$ '
    ## PWD as window name
    #export PS1='\u@\h:\W\$ '
    #export PROMPT_COMMAND='echo -ne "\033k$(basename $(pwd))\033\\"'
    ## PWD when no command is running, otherwise current command name as window name
    export PS1='\u@\h:\W\$ '
    export PROMPT_COMMAND='echo -ne "\033k\033\0134\033k$(basename $(pwd))\033\\"'
else
    export PS1='\u@\h:\W\$ '
fi

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

stty sane
if [ "`stty | grep erase`" = "" ] ; then
    stty erase 
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ `uname` = "Linux" ]; then
    alias ls='ls -NF --show-control-chars'
    # if you use color ls, comment out above line and uncomment below 2 lines.
    LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.i386.rpm=01;31:*.src.rpm=01;30:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:' ; export LS_COLORS
    alias ls='ls --color=auto -NF --show-control-chars'
elif [ `uname` = 'FreeBSD' ]; then
    export LSCOLORS=gxfxcxdxbxegedabagacad
    alias ls='ls -G'
fi

# History filter
export HISTCONTROL=ignoreboth

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -l'
alias la='ls -aF'
alias sc='screen -D -RR'

alias Emacs='/usr/bin/emacs'
alias emacs='/usr/bin/emacs -nw'
alias open='xdg-open'

export EDITOR='emacs -nw'
export PATH=~/script:$PATH

# golang
if [ -x "`which go`" ]; then
    export GOROOT=`go env GOROOT`
    export GOPATH=~/.go
    export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
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

alias sshkey='eval `cat ${SSH_AGENT_FILE}`'
alias sshrm='rm -f ${SSH_AGENT_FILE}'

# ssh 
alias machine1='ssh -l yourname 192.168.0.11'
alias machine1pf='ssh -l yourname -p 2211 localhost'
