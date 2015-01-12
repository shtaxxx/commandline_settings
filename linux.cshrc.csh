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

if ( -f ~/.lang/langrc.sh ) then
    source ~/.lang/langrc.sh
else if ( -f /etc/sysconfig/lang ) then
    setenv LANG `cat /etc/sysconfig/lang`
endif

if ( `uname` == "Linux" ) then
    alias ls 'ls -NF --show-control-chars'
    # if you use color ls, comment out above line and uncomment below 2 lines.
    setenv LS_COLORS 'no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.i386.rpm=01;31:*.src.rpm=01;30:*.jpg=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:'
    alias ls 'ls --color=auto -NF --show-control-chars'
else if ( `uname` == 'FreeBSD' ) then
    setenv LSCOLORS gxfxcxdxbxegedabagacad
    alias ls 'ls -G'
endif

set autolist
set autocorrect 
set savehist=1000

alias rm 'rm -i'
alias cp 'cp -i'
alias mv 'mv -i'
alias ll 'ls -l'
alias la 'ls -aF'
alias sc 'screen -D -RR'

alias Emacs '/usr/bin/emacs'
alias emacs '/usr/bin/emacs -nw'
alias open 'xdg-open'

setenv EDITOR 'emacs -nw'
set path=(\
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

# ssh-agent
setenv SSH_AGENT_FILE "${HOME}/.ssh/.ssh-agent.`hostname`"
if ( -f ${SSH_AGENT_FILE} ) then
    eval `cat ${SSH_AGENT_FILE}`
    set ssh_agent_exist=0    
    foreach id (`ps ax|grep 'ssh-agent'|sed -e 's/\([0-9]\+\).*/\1/'`)
        if ( ${SSH_AGENT_PID} == ${id} ) then 
            set ssh_agent_exist=1
        endif
    end
    if ( $ssh_agent_exist == 0 ) then
        rm -f ${SSH_AGENT_FILE}
        ssh-agent > ${SSH_AGENT_FILE}
        chmod 600 ${SSH_AGENT_FILE}
        eval `cat ${SSH_AGENT_FILE}`
        ssh-add
    endif
else
    ssh-agent > ${SSH_AGENT_FILE}
    chmod 600 ${SSH_AGENT_FILE}
    eval `cat ${SSH_AGENT_FILE}`
    ssh-add
endif

alias sshkey 'eval `cat ${SSH_AGENT_FILE}`'
alias sshrm 'rm -f ${SSH_AGENT_FILE}'

# ssh 
alias machine1 'ssh -l yourname 192.168.0.11'
alias machine1pf 'ssh -l yourname -p 2211 localhost'
