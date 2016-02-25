# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"  # Look in ~/.oh-my-zsh/themes/ or set this to "random"


# CASE_SENSITIVE="true"           # Uncomment the following line to use case-sensitive completion.
# DISABLE_AUTO_UPDATE="true"      # Uncomment the following line to disable bi-weekly auto-update checks.
export UPDATE_ZSH_DAYS=1        # Uncomment the following line to change how often to auto-update (in days).

# DISABLE_LS_COLORS="true"        # Uncomment the following line to disable colors in ls.
# DISABLE_AUTO_TITLE="true"       # Uncomment the following line to disable auto-setting terminal title.
# ENABLE_CORRECTION="true"        # Uncomment the following line to enable command auto-correction.
# COMPLETION_WAITING_DOTS="true"  # Uncomment the following line to display red dots whilst waiting for completion.

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# ZSH_CUSTOM=/path/to/new-custom-folder  # Would you like to use another custom folder than $ZSH/custom?

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(brew brew-cask docker git git-flow history history-substring-search vagrant)

# User configuration
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# export ARCHFLAGS="-arch x86_64"  # Compilation flags
# export SSH_KEY_PATH="~/.ssh/dsa_id"  # ssh


if [ -f ~/.bootstrap ]; then
    source $HOME/.bootstrap
fi

