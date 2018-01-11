#!/usr/bin/env zsh

#POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=5
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(aws kubecontext newline dir vcs status)
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=() # time
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S %y.%m.%d }"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MODE='nerdfont-complete'
source $WORKSPACE_GITHUB/powerlevel9k/powerlevel9k/powerlevel9k.zsh-theme

echo "Loaded powerlevel9k theme"
