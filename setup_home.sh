#!/bin/bash

cd ~/workspace/git/
git clone git://github.com/robbyrussell/oh-my-zsh.git
git clone git://github.com/amix/vimrc.git

cd ~/
# if personal then ln -s ~/GoogleDrive/workspace/home/ssh/config_jnbnyc config

ln -s ~/workspace/git/oh-my-zsh .oh-my-zsh
ln -s ~/GoogleDrive/workspace/home/zshrc .zshrc

ln -s ~/worksapce/git/vimrc .vim_runtime
ln -s ~/GoogleDrive/workspace/home/vimrc .vimrc

ln -s ~/GoogleDrive/workspace/home/bootstrap .bootstrap
ln -s ~/GoogleDrive/workspace/home/aliases .aliases


ln -s ~/GoogleDrive/workspace/home/work-bootstrap .work-bootstrap
ln -s ~/GoogleDrive/workspace/home/work-aliases .work-aliases


chsh -s /bin/zsh
source ~/.zshrc