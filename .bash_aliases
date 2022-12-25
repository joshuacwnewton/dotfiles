# Manage dotfiles using a bare repository located in the home directory. Source:
# https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/ 
alias config='/usr/bin/git --git-dir=/home/joshua/.cfg/ --work-tree=/home/joshua'

# One-liner for connecting to work VPN
# Secrets are stored in a separate file, then that file is loaded via .bashrc
alias vpn='echo -n "$OPENCONNECT_PASS" | sudo openconnect -u "$OPENCONNECT_USER" --authgroup "$OPENCONNECT_GROUP" --passwd-on-stdin "$OPENCONNECT_URL"'
