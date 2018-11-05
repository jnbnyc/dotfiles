#!/usr/bin/env zsh

function setup-linux-path {
  # export PATH=$GOBIN:$DEFAULT_PATH
}

function setup-osx-path {
  GNUBIN=libexec/gnubin
  GNUMAN=libexec/gnuman

  # brew --prefix coreutils:
  COREUTILS_BASE=/usr/local/opt/coreutils
  COREUTILS_PATH=$COREUTILS_BASE/$GNUBIN
  COREUTILS_MANPATH=$COREUTILS_BASE/$GNUMAN

  # brew --prefix findutils:
  FINDUTILS_BASE=
  FINDUTILS_PATH=$FINDUTILS_BASE/$GNUBIN
  FINDUTILS_MANPATH=$FINDUTILS_BASE/$GNUMAN

  # brew --prefix gnu-sed:
  GSED_BASE=/usr/local/opt/gnu-sed
  GSED_PATH=$GSED_BASE/$GNUBIN
  GSED_MANPATH=$GSED_BASE/$GNUMAN

  # brew --prefix gnu-tar:
  GTAR_BASE=/usr/local/opt/gnu-tar
  GTAR_PATH=$GTAR_BASE/$GNUBIN
  GTAR_MANPATH=$GTAR_BASE/$GNUMAN

  PYTHON_PATH=/usr/local/opt/python/libexec/bin
  export PATH=$USRPATH:$GOBIN:$COREUTILS_PATH:$FINDUTILS_PATH:$GSED_PATH:$GTAR_PATH:$PYTHON_PATH:$DEFAULT_PATH
  export MANPATH=$COREUTILS_MANPATH:$FINDUTILS_MANPATH:$GSED_MANPATH:$GTAR_MANPATH:$MANPATH
}

# source extras
function scan-for-files {
  for each in $(find $DOTFILES_DIR/extras -type f -iname "*.sh"); do
    source $each
  done
}

if [[ "$(uname)" == "Darwin" ]]; then
  setup-osx-path
else
  setup-linux-path
fi
scan-for-files

# brew --prefix source-highlight:
# export LESS=" -RN"
# export LESSOPEN="| /usr/local/opt/source-highlight/bin/source-highlight-esc.sh %s"

# Completions
#test -e "${DOTFILES_DIR}/iterm2_shell_integration.zsh" && source "${DOTFILES_DIR}/iterm2_shell_integration.zsh"$

#AWS_BIN=/usr/local/aws/bin
#source /usr/local/bin/aws_zsh_completer.sh
