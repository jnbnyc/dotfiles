# requires bootstrap!

alias dotfiles='cd $DOTFILES_DIR'
alias ss='screensaver'

# handy shortcuts
## Colorize the ls output ##
alias la='ls -altrh'
alias ll='ls -alFh'  ## Use a long listing format ##
alias l.='ls -d .*' ## Show hidden files ##
#   alias h='history'
#   alias c='clear'
#   # alias rmd='rm -rf'
alias cpd='cp -rf'
alias mkdir='mkdir -pv'
alias ping='ping -c 5'  ## Stop after sending count ECHO_REQUEST packets ##
alias fastping='ping -c 100 -s.2'  ## Do not wait interval 1 second, go fast ##

# Higher verbosity
alias mv='mv -v'
alias cp='cp -v'
alias ln='ln -v'
alias rm='rm -v'
#   alias cwhich='command which'

#  useful tools
function view-csv { column -s, -t < $1 | less -#2 -N -S; }

## Colorize the grep command output for ease of use (good for log files) ##
# alias grep='grep --color=auto'
# alias egrep='egrep --color=auto'
# alias fgrep='fgrep --color=auto'

# folder navigation
alias  ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias ..6='cd ../../../../../..'
alias ..7='cd ../../../../../../..'
alias ..8='cd ../../../../../../../..'

function cd { builtin cd "$@" && ls; }


# shortcuts to directories
function cellar   { cd /usr/local/Cellar/$1; }  # brew
function caskroom { cd /opt/homebrew-cask/Caskroom/$1; }  # brew cask
function ws       { cd $WORKSPACE/$1; }
function scm      { cd $WORKSPACE/github.com/$1; }
function buhay   { cd $WORKSPACE/github.com/johnbuhay/$1; }
function gdrive   { cd $GDRIVE/$1; }
function cs       { cd $CLOUDSTATION/$1 }


# shortcuts for applications
alias cask='brew cask'
alias vi='vim -N'
alias svi='sudo vim'


# mach displays the basic information about the system
function mach {
    echo -e "\nMachine information:" ; uname -a
    echo -e "\nUsers logged on:" ; w -h
    echo -e "\nCurrent date :" ; date
    echo -e "\nMachine status :" ; uptime
    # [ $(uname -s) == "Linux" ] && echo -e "\nMemory status :" ; free
    echo -e "\nFilesystem status :"; df -h
}


# generate a random password with a specified length, defaults to 18
function rpass {
  tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${1:=18} | xargs
}


# functions for curl
function time-curl {
  curl -w "\n
              # time_namelookup:  %{time_namelookup}\n
              # time_connect:  %{time_connect}\n
              # time_appconnect:  %{time_appconnect}\n
              # time_pretransfer:  %{time_pretransfer}\n
              # time_redirect:  %{time_redirect}\n
              # time_starttransfer:  %{time_starttransfer}\n
              ----------\n
              # time_total:  %{time_total}\n
          \n" -s -v $@
}

function clean-desktop {
  desktop_dir=${HOME}/Desktop
  screenshots_dir=$desktop_dir/screenshots/$(date +%F)
  [ -d "$screenshots_dir" ] || mkdir -pv $screenshots_dir

  find $desktop_dir -maxdepth 1 -type f -name "Screen*png" -exec mv -v {} $screenshots_dir \;

  echo "Done cleaning"
}

echo 'Loaded aliases'
