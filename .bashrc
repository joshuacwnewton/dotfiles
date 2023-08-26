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
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}
export PS1="\[\e[91m\]\$(parse_git_branch)\[\e[00m\]$PS1"

# SPINALCORDTOOLBOX (installed on 2023-01-05 14:02:02)
export PATH="/home/joshua/repos/spinalcordtoolbox/bin:$PATH"
export SCT_DIR=/home/joshua/repos/spinalcordtoolbox

# Add ~/.local/bin to the path
export PATH="/home/joshua/.local/bin:$PATH"
