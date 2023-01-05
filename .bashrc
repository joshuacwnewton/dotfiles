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