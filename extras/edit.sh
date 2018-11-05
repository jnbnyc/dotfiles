# requires bootstrap!

function edit {
  # shortcuts to exit & reload shell preferences
  # $_ will recall the last argument of the previous command
  case "$1" in
    aliases|colors|docker|jira|git|github)
      vim $DOTFILES_DIR/extras/$1.sh && source $_
    ;;
    bootstrap)
      vim $DOTFILES_DIR/zsh/bootstrap.zsh && source $_
    ;;
    wework)
      vim $DOTFILES_DIR/extras/wework-bootstrap.sh && source $_
    ;;
    ssh)
      shift; vim $HOME/.ssh/config.d/$1
    ;;
    hosts)
      sudo vim /etc/hosts
    ;;
    zsh)
      vim $DOTFILES_DIR/zsh/zshrc && source $_
    ;;
    *)
      if [[ -f $1 ]]; then
        vim $1
      else
        printf "Don't know about that: $1"
      fi
  esac
}

echo Loaded edit
