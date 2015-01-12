# If bash does not exist, return
[ "$BASH" = "" ] &&  return

if [ -z "$PS1" ]; then
    return
fi

# source system wide aliases
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# console style
if [ $TERM == 'screen' ]; then
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

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

stty sane
if [ "$(stty | grep erase)" = "" ] ; then
    stty erase 
fi

export LANG=ja_JP.UTF-8

export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -G'

# History filter
export HISTCONTROL=ignoreboth

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ll='ls -l'
alias la='ls -aF'
alias sc='screen -D -RR'

alias Emacs='open -a /Applications/Emacs.app'
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'

export EDITOR='vi'
export SVN_SSH='ssh -q'

# PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/include:$PATH
export PATH=~/script:$PATH

# golang
if [ -x "`which go`" ]; then
    export GOROOT=`go env GOROOT`
    export GOPATH=~/.go
    export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
fi

# ssh 
alias machine1='ssh -l yourname 192.168.0.11'
alias machine1pf='ssh -l yourname -p 2211 localhost'
