#!/usr/bin/env bash

# set -x

HOME=${HOME:-/Users/$(whoami)}
GDRIVE=$HOME/googleDrive
WORKSPACE=$HOME/workspace
TOOLS_DIR=$WORKSPACE/tools
DOTFILES_DIR=$GDRIVE/dotfiles
BUHAY_BIN=$HOME/bin


# make dirs if they dont exist
[ -d "$BUHAY_BIN" ] || mkdir -pv $BUHAY_BIN
[ -d "$TOOLS_DIR" ] || mkdir -pv $TOOLS_DIR
[ -d "$GDRIVE" ] || mkdir -pv $GDRIVE

cd $GDRIVE
[ -d "$DOTFILES_DIR" ] || git clone https://github.com/jnbnyc/dotfiles.git

cd $TOOLS_DIR
[ -d "$TOOLS_DIR/oh-my-zsh" ] || git clone https://github.com/robbyrussell/oh-my-zsh.git
[ ! -L "$TOOLS_DIR/oh-my-zsh" ] && ln -s $TOOLS_DIR/oh-my-zsh $HOME/.oh-my-zsh
[ -d "$TOOLS_DIR/sublime-ansible" ] || git clone https://github.com/clifford-github/sublime-ansible.git
[ -d "$TOOLS_DIR/vimrc" ] || git clone https://github.com/amix/vimrc.git

SUBLIME_TXT_DIR="$HOME/Library/Application Support/Sublime Text 3/Packages"
SUBLIME_ANSIBLE=$SUBLIME_TXT_DIR/Ansible
[ -d "${SUBLIME_ANSIBLE}" ] || mkdir -pv "${SUBLIME_ANSIBLE}"
[ ! -L "${SUBLIME_ANSIBLE}" ] && ln -sv $TOOLS_DIR/sublime-ansible "${SUBLIME_ANSIBLE}"

[ ! -L "$HOME/.bootstrap" ] && ln -sv $DOTFILES_DIR/bootstrap $HOME/.bootstrap
[ ! -L "$HOME/.aliases" ] && ln -sv $DOTFILES_DIR/aliases $HOME/.aliases
# [ ! -L "$HOME/.vimrc" ] && ln -sv $DOTFILES_DIR/vimrc $HOME/.vimrc
# [ ! -L "$HOME/.zshrc" ] && ln -sv $DOTFILES_DIR/zshrc $HOME/.zshrc



# install gnu tools

GNUTOOLS="sed grep find"
BREWTOOLS="coreutils findutils gnu-sed gnu-tar source-highlight"
BASECOMPLETIONS=""
# /usr/local/etc/bash_completion.d

## git config
## install deps
## vim config
## sublime config
## docker config
## toggle bash vs zsh
## bash completions
## gnutools with toggle


# if personal then ln -s ~/GoogleDrive/workspace/home/ssh/config_jnbnyc config


# ln -s ~/GoogleDrive/workspace/home/zshrc .zshrc

# ln -s ~/worksapce/git/vimrc .vim_runtime
# ln -s ~/GoogleDrive/workspace/home/vimrc .vimrc

# ln -s ~/GoogleDrive/workspace/home/bootstrap .bootstrap
# ln -s ~/GoogleDrive/workspace/home/aliases .aliases


# ln -s ~/GoogleDrive/workspace/home/work-bootstrap .work-bootstrap
# ln -s ~/GoogleDrive/workspace/home/work-aliases .work-aliases


# chsh -s /bin/zsh
# source ~/.zshrc
