if ( ! $?prompt ) then
    exit 0
endif

# source system wide aliases
if ( -f /etc/csh.cshrc ) then
    source /etc/csh.cshrc
endif

stty sane
if ( "`stty | grep erase`" == "" ) then
    stty erase 
endif

# console style
if ( $TERM == 'screen' ) then
    set echo_style=both
    set prompt="%n@%m:%c1$ "
    alias precmd 'echo -n "\033k\033\0134\033k`basename ${cwd}`\033\\"'
else
    set prompt="%n@%m:%c1$ "
endif

setenv LANG en_US.UTF-8
setenv LC_ALL en_US.UTF-8

set autolist
set autocorrect 
set savehist=10000

setenv LSCOLORS gxfxcxdxbxegedabagacad
alias ls 'ls -G'

alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'
alias ll 'ls -l'
alias la 'ls -aF'
alias sc 'screen -D -RR'

setenv EDITOR 'vi'
setenv SVN_SSH 'ssh -q'

# PATH
set path=(\
    /usr/local/bin \
    /usr/include \
    ~/script \
    $path \
    )
