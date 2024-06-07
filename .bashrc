# Debian installations come with a preconfigured /etc/skel/.bashrc file, see:
#   - https://askubuntu.com/a/1045951 
# I prefer distinguishing between the default configuration and my additions.
# (Though, maybe in the future, one of my additions will conflict with the 
#  default configuration, requiring me to pick and choose from the default.)
if [ -f /etc/skel/.bashrc ]; then
    . /etc/skel/.bashrc
fi

# Define any environment-variable based secrets in a separate file, that way 
# they don't get accidentally committed to my dotfiles repo
if [ -f ~/.bash_secrets ]; then
    . ~/.bash_secrets
fi

# Display git branch/tag in shell prompt
# Source: Unclear! (This function has been floating around the internet for at 
#         least a decade...)
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d; s/* \(.*\)/\1/; s/(//; s/)//; s/ /-/'g
}
format_git_branch() {
    if [ ! -z "$(parse_git_branch)" ]
    then
        echo "\[\e[91m\]\$(parse_git_branch)\[\e[00m\]|" 
    else
        echo ""
    fi
}
export PS1="$(format_git_branch)$PS1"

# HSTR configuration - add this to ~/.bashrc
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
shopt -s cmdhist                 # Multiple commands on one line show up as a single line
export HISTCONTROL=ignoredups    # ignore duplicate commands in history
export HISTFILESIZE=2000000      # increase history file size (default is 500)
export HISTSIZE=10000            # increase history size (default is 500)
export HISTIGNORE='ls:ll:la:pwd:clear:history'
export HISTTIMEFORMAT='%F %T '
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
# if this is interactive shell, then bind 'kill last command' to Ctrl-x k
if [[ $- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi

# Only call bind commands if stdout is a TTY
if [ -t 1 ]; then
    # Bind history commands to up/down arrows
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi


# SPINALCORDTOOLBOX (installed on 2023-01-05 14:02:02)
export PATH="/home/joshua/repos/spinalcordtoolbox/bin:$PATH"
export SCT_DIR=/home/joshua/repos/spinalcordtoolbox

# Add ~/.local/bin to the path
export PATH="/home/joshua/.local/bin:$PATH"

# Disable middle click in touchpad
# Source: https://www.reddit.com/r/linuxmint/comments/bm0zex/comment/emvtrhw/
export TRACKPAD_ID=$(xinput list | grep "SynPS/2 Synaptics TouchPad" | cut -d "=" -f 2 | cut -d "[" -f 1 | xargs)
xinput set-button-map $TRACKPAD_ID 1 1 3 4 5 6 7