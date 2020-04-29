#!/bin/bash
set -euxo pipefail

# fix up network interface (needed to add nameserver)
# echo <<EOF
# ---
# network:
#   version: 2
#   renderer: networkd
#   ethernets:
#     enp0s8:
#       addresses:
#       - 10.0.2.200/24
#       nameservers:
#         addresses: [10.0.2.5]
# EOF > /etc/netplan/50-vagrant.yaml
# netplan apply

# prevent apt-get et al from asking questions.
# NB even with this, you'll still get some warnings that you can ignore:
#     dpkg-preconfigure: unable to re-open stdin: No such file or directory
export DEBIAN_FRONTEND=noninteractive

# update the package cache.
apt-get update

# install vim.
apt-get install -y --no-install-recommends vim
cat >/etc/vim/vimrc.local <<'EOF'
syntax on
set background=dark
set esckeys
set ruler
set laststatus=2
set nobackup
EOF

# configure the shell.
cat >/etc/profile.d/login.sh <<'EOF'
[[ "$-" != *i* ]] && return
export EDITOR=vim
export PAGER=less
alias l='ls -lF --color'
alias ll='l -a'
alias h='history 25'
alias j='jobs -l'
EOF

cat >/etc/inputrc <<'EOF'
set input-meta on
set output-meta on
set show-all-if-ambiguous on
set completion-ignore-case on
"\e[A": history-search-backward
"\e[B": history-search-forward
"\eOD": backward-word
"\eOC": forward-word
EOF
