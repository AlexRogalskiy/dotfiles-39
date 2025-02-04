#! /usr/bin/env bash

set -e

cd "$HOME"

echo "Clone repository from GitHub"
git clone https://github.com/ad-si/dotfiles

cd dotfiles

./bin/symlink-dotfiles

# Mac OS X specific Code
if uname | grep -q "Darwin"
then
  ./install-macos.sh
elif lsb_release -a | grep -q 'Ubuntu'
then
  ./install-ubuntu.sh
fi

# Set fish as default shell
fishPath="$(which fish)"

if "$fishPath"
then
  echo "$fishPath" >> /etc/shells
  chsh -s "$fishPath"
else
  echo "Error: fish is not yet installed"
  exit 1
fi


# Set correct GPG path for git
git config --global gpg.program "$(which gpg)"

./bin/setup-docker
# ./bin/setup-cargo
# ./bin/setup-go
# ./bin/setup-npm


# Set default apps for file extensions
duti ./home/duti
