# setup keyboard shortcut to open terminal with Super+T

# install necessary programs
sudo apt update && sudo apt upgrade
sudo apt install git gcc python-is-python3

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
# needed for cifs mounting (e.g. duke)
sudo apt install keyutils cifs-utils
# needed for git-annex setup
sudo apt install git-annex

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

# install zoom + parsec debs

# install docker CE (for testing the SCT installation instructions)
# https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
sudo apt update
sudo apt install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# add docker group to avoid having to run sudo
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world

# install GitHub CLI
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y
