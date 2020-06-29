# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Declare user-specific directories
DIRECTORIES="
    $HOME/bin
    $HOME/.local/bin
    $HOME/.cargo/bin
    "

# Add user-specific directories to path
for DIR in $DIRECTORIES
do
    if [[ -d "$DIR" && ! "$PATH" =~ "$DIR" ]]
    then
        PATH="$DIR:$PATH"
    fi
done
export PATH

# Prompt format
export PS1="[\u@\h \W]\$ "

# Localization
export LC_TIME=C

# User specific aliases and functions
alias la="ls -a"

# Cleanup
unset DIRECTORIES
