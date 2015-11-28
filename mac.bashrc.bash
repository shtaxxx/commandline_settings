# If bash does not exist, return
[ "$BASH" = "" ] &&  return

if [ -z "$PS1" ]; then
    return
fi

# source system wide aliases
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

stty sane
if [ "$(stty | grep erase)" = "" ] ; then
    stty erase 
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

function share_history {
    history -a
    history -c
    history -r
}

# console style
if [ "`echo $TERM | grep 'screen'`" != "" ]; then
    ## Current command name as window name
    #export PS1='\[\033k\033\\\][\u@\h \W]\$ '
    #export PS1='\[\033k\033\\\]\u@\h:\W\$ '
    ## PWD as window name
    #export PS1='\u@\h:\W\$ '
    #export PROMPT_COMMAND='echo -ne "\033k$(basename $(pwd))\033\\"'
    ## PWD when no command is running, otherwise current command name as window name
    #export PS1='\u@\h:\W\$ '
    #export PROMPT_COMMAND='echo -ne "\033k\033\0134\033k$(basename $(pwd))\033\\"'
    ## Above with a shared history among all terminals
    export PS1='\u@\h:\W\$ '
    export PROMPT_COMMAND='echo -ne "\033k\033\0134\033k$(basename $(pwd))\033\\";share_history'
else
    export PS1='\u@\h:\W\$ '
    ## With a shared history among all terminals
    export PROMPT_COMMAND='share_history'
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#export HISTCONTROL=ignoreboth
export HISTCONTROL=ignoredups
export HISTIGNORE="cd*:pwd*:fg*:bg*"
export HISTSIZE=10000

export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -G'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -l'
alias la='ls -aF'
alias sc='screen -D -RR'

export EDITOR='vi'
export SVN_SSH='ssh -q'

# PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/include:$PATH
export PATH=~/script:$PATH
