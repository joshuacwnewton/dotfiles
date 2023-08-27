# setup keyboard shortcut to open terminal with Super+T

# install necessary programs
sudo apt install git gcc

# setup ssh key first (temporary until backed-up ssh keys can be reloaded)
# - https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
# - https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account

# setup dotfiles repository
cd ~
git init .
git branch -m main
git remote add origin git@github.com:joshuacwnewton/dotfiles.git
git fetch
# move/remove any listed conflicting files
mv ~/.bashrc ~/.bashrc.bak
mv ~/.profile ~/.profile.bak
rm ~/.gitconfig
rm ~/.bash_logout
# checkout main branch
git checkout main

# install programs post-dotfile installation
sudo apt install gnome-tweaks # Keyboard & Mouse -> Middle Click Paste off
# openconnect -> needed for PolyMtl VPN
sudo apt install openconnect network-manager-openconnect network-manager-openconnect-gnome

# install pycharm
cd ~/Downloads
sudo tar xzf pycharm-*.tar.gz -C /opt/
cd /opt/pycharm-*/bin
sh pycharm.sh
# change terminal settings to "/bin/bash --rcfile ~/.pycharmrc"

# install fsleyes (post-sct install)
source ${SCT_DIR}/python/etc/profile.d/conda.sh
conda create -c conda-forge -p ~/repos/fsleyes fsleyes -y
sudo ln -s ~/repos/fsleyes/bin/fsleyes /usr/local/bin/fsleyes
