#!/usr/bin/env zsh

export HISTFILE=${HOME}/.zsh_history
export HIST_STAMPS="yyyy-mm-dd"
export HISTSIZE=10000
export SAVEHIST=10000
setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY
