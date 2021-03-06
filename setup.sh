#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 
cd $HOME

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y nodejs
sudo apt-get install -y npm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
# npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
# sudo add-apt-repository -y ppa:cassou/emacs
# sudo apt-get -qq update
# sudo apt-get install -y emacs24-nox emacs24-el emacs24-common-non-dfsg

# Install Heroku toolbelt
# https://toolbelt.heroku.com/debian
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    if [ -d ./dotfiles.old ]; then
       rm -rf ./dotfiles.old2
       mv dotfiles.old dotfiles.old2
    fi
    mv dotfiles dotfiles.old
fi
git clone https://github.com/vzk/dotfiles.git
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sb dotfiles/.vimrc .

## setup VIM
# get Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo npm install -g jshint # Install link for javascript
vim +PluginInstall +qall

# get Vundle

# install distingusied color scheme
mkdir ~/.vim/colors
wget https://raw.githubusercontent.com/Lokaltog/vim-distinguished/develop/colors/distinguished.vim -O ~/.vim/colors/distinguished.vim


## setup commonly used components for javascript development
sudo npm install -g connect
sudo npm install -g serve-static #for setting up a  server

# node paths are installed in the following directory - they may note be always included
export NODE_PATH=/usr/local/lib/node_modules/

# Setup the working git and cd to it. 
# ** THIS IS THE LAST COMMOAND IN SETUP **
#source $HOME/setup/setup_git.sh
