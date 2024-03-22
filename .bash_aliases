# One-liner for connecting to work VPN
# Secrets are stored in a separate file, then that file is loaded via .bashrc
alias vpn='echo -n "$OPENCONNECT_PASS" | sudo openconnect -u "$OPENCONNECT_USER" --authgroup "$OPENCONNECT_GROUP" --passwd-on-stdin "$OPENCONNECT_URL"'

# Make mounting and accessing duke easier
duke() {
    sudo mkdir --parents "/mnt/duke/$1"
    sudo mount -t cifs "//duke.neuro.polymtl.ca/$1" "/mnt/duke/$1" -o username=$GRAMES_USER,password="$GRAMES_PASS",noexec
    cd "/mnt/duke/$1"
}

# Make mounting and accessing data easier
data() {
    ssh git@data.neuro.polymtl.ca "$1"
}

# No longer functioning. Check https://github.com/neuropoly/computers/issues/683 for progress.
# datasets() {
#     git clone "root@data.neuro.polymtl.ca:datasets/$1" "$HOME/repos/annex/$1" && cd "$HOME/repos/annex/$1"
# }

# Clean up local and remote branches that have been deleted on GitHub
# Source: https://stackoverflow.com/questions/7726949/remove-tracking-branches-no-longer-on-remote#comment91928557_38404202
# $'' syntax: https://stackoverflow.com/a/55528377
alias git-cleanup=$'git checkout master && git pull && git remote prune origin && git branch -vv | grep \': gone]\'|  grep -v "\*" | awk \'{ print $1; }\' | xargs -r git branch -D'

# Save some time switching to the sct's installation directory, since I do this a lot
alias sct='cd $SCT_DIR'

# Override the default `ls` command with preferred options
alias ls='ls -ghFv --group-directories-first --color=auto'
alias lsa='ls -ghFva --group-directories-first --color=auto'