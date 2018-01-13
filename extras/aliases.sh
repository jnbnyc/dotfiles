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

# # Higher verbosity
#   alias mv='mv -i'
#   alias cp='cp -i'
#   alias ln='ln -i'
#   alias cwhich='command which'

#  useful tools
function view-csv() { column -s, -t < $1 | less -#2 -N -S; }

# ## Colorize the grep command output for ease of use (good for log files) ##
# # alias grep='grep --color=auto'
# # alias egrep='egrep --color=auto'
# # alias fgrep='fgrep --color=auto'

# folder navigation
alias  ..='cd ..'
alias ..2='cd ../../'
alias ..3='cd ../../../'
alias ..4='cd ../../../../'
alias ..5='cd ../../../../../'
alias ..6='cd ../../../../../../'
alias ..7='cd ../../../../../../../'
function cd { builtin cd "$@" && ls; }


# shortcuts to directories
function cellar   { cd /usr/local/Cellar/$1; }  # brew
function caskroom { cd /opt/homebrew-cask/Caskroom/$1; }  # brew cask
function ws       { cd $WORKSPACE/$1; }
function scm      { cd $WORKSPACE/github.com/$1; }
function jnbnyc   { cd $WORKSPACE/github.com/jnbnyc/$1; }
function gdrive   { cd $GDRIVE/$1; }
function cs       { cd $CLOUDSTATION/$1 }


# shortcuts for applications
alias cask='brew cask'
alias vi='vim -N'
alias svi='sudo vim'


# # mach displays the basic information about the system
#   mach()
#   {
#       echo -e "\nMachine information:" ; uname -a
#       echo -e "\nUsers logged on:" ; w -h
#       echo -e "\nCurrent date :" ; date
#       echo -e "\nMachine status :" ; uptime
#       #echo -e "\nMemory status :" ; free
#       echo -e "\nFilesystem status :"; df -h
#   }


# generate a random password with a specified length, defaults to 18
  rpass()  {  tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${1:=18} | xargs  }


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

echo 'Loaded aliases'
