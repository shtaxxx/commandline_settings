if ( ! $?prompt ) then
    exit 0
endif

# source system wide aliases
if ( -f /etc/csh.cshrc ) then
    source /etc/csh.cshrc
endif

# console style
if ( $TERM == 'screen' ) then
    set echo_style=both
    set prompt="%n@%m:%c1$ "
    alias precmd 'echo -n "\033k\033\0134\033k`basename ${cwd}`\033\\"'
else
    set prompt="%n@%m:%c1$ "
endif

stty sane
if ( "`stty | grep erase`" == "" ) then
    stty erase 
endif

setenv LANG ja_JP.UTF-8

setenv LSCOLORS gxfxcxdxbxegedabagacad
alias ls 'ls -G'

set autolist
set autocorrect 
set savehist=1000

alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'
alias ll 'ls -l'
alias la 'ls -aF'
alias sc 'screen -D -RR'

alias Emacs 'open -a /Applications/Emacs.app'
alias emacs '/Applications/Emacs.app/Contents/MacOS/Emacs -nw'

setenv EDITOR 'vi'
setenv SVN_SSH 'ssh -q'

# PATH
set path=(\
    /usr/local/bin \
    /usr/include \
    ~/script \
    $path \
    )
        
# golang
if (-x "`which go`") then
    setenv GOROOT `go env GOROOT`
    setenv GOPATH ~/.go
    set path= ( \
        $GOROOT/bin \
        $GOPATH/bin \
        $path \
        )
endif

# ssh 
alias machine1 'ssh -l yourname 192.168.0.11'
alias machine1pf 'ssh -l yourname -p 2211 localhost'
