# docker shortcuts + functions

alias c='docker-compose'
alias d='docker'

alias dcup='docker-compose up'
alias dcdown='docker-compose down'

alias vp='docker-compose provision'
alias in='docker-compose up && docker-compose ssh'

alias up='docker-compose up'
alias down='docker-compose down'

alias bounce='dbounce'

function dbounce {
  docker-compose rm -f; docker-compose up -d $1
}

function docker-sleep {
  docker run -d --name sleepingbeauty --entrypoint /bin/sleep $1 ${2:-1h}
}

function docker-start {
  open /Applications/Docker.app
}

function docker-exec { docker exec -it $1 $2 }
function docker-sh { docker exec -it $1 sh }
function docker-bash { docker exec -it $1 bash }

function dxc {
  if [ -z "$1" ]; then
    _image=$(docker ps -l -q)
  else
    _image=$(docker ps | grep $1 | awk '{print $1}')
  fi
  echo docker-bash $_image || echo docker-sh $_image
}

function drun { docker run -it $@; }

echo "Loaded docker shortcuts"
