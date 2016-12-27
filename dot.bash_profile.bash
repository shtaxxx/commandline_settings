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

# read my settings
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
