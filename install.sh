#!/bin/bash

# get dir of this file so the repo can be anywhere
DIR=$(cd "$(dirname "${BASH_SOURCE}")"; pwd -P)

# switch to home dir
cd ~

# set up bash_profile
CMD="source $DIR/.bash_profile"
if ! grep -q "$CMD" .bash_profile ; then
	echo "bash_profile: Adding $CMD"
	echo -e "\n$CMD\n" >> .bash_profile
fi

# install Sublime CLI tool
echo "install Sublime CLI tool"
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" /usr/local/bin/subl

# set up git config
echo "gitconfig: including $DIR/.gitconfig"
git config --global include.path "$DIR/.gitconfig"
