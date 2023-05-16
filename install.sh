#!/bin/bash

# get dir of this file so the repo can be anywhere
DIR=$(cd "$(dirname "${BASH_SOURCE}")"; pwd -P)

# switch to home dir
cd ~

# install git completion if it exists
GC_FILE="$(brew --prefix git)/etc/bash_completion.d/git-completion.bash"
CMD="source $GC_FILE"
if [ -f "$GC_FILE" ] && ! grep -q "$CMD" .bash_profile; then
  echo "bash_profile: Adding $CMD"
  echo -e "\n$CMD\n" >> .bash_profile
fi

# set up bash_profile
touch .bash_profile
CMD="source $DIR/.bash_profile"
if ! grep -q "$CMD" .bash_profile ; then
	echo "bash_profile: Adding $CMD"
	echo -e "\n$CMD\n" >> .bash_profile
fi

# install Sublime CLI tool
echo "Installing Sublime CLI tool"
ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

# set up git config
echo "gitconfig: including $DIR/.gitconfig"
git config --global include.path "$DIR/.gitconfig"
