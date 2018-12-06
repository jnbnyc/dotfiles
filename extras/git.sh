# git shortcuts + functions

function git-alias { git config --get-regexp alias; }
# alias glog='git log --oneline --all --graph --decorate'

# setup commit author
function gitcfg {
  git config --global user.name "John Buhay"
  if [[ "$1" == "johnbuhay" ]]; then
    # git config --local user.name johnbuhay
    git config --local user.email "jnbuhaynyc@gmail.com"
  else
    git config --local user.email "john.buhay@wework.com"
  fi
}


function git-ignore-setup() {
  git config --global core.excludesfile $HOME/.gitignore_global
}

function git-config-setup() {
  ln -s $DOTFILES_DIR/git/gitconfig $HOME/.gitconfig
}

# shortcuts for git-flow
#   alias gff='git flow feature'
#   alias gfr='git flow release'
#   alias gfh='git flow hotfix'
#   alias gffs='git flow feature start'
#   alias gfff='git flow feature finish'
#   alias gfrs='git flow release start'
#   alias gfrf='git flow release finish'

# bash/zsh completions
# [ "$SHELL" = "/bin/bash" ] && source /opt/local/etc/bash_completion.d/git-completion.bash
# [ "$SHELL" = "/bin/zsh" ] && /usr/local/etc/bash_completion.d/docker-machine

echo 'Loaded git shortcuts'
