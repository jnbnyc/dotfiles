# docker shortcuts + functions

alias compose='docker-compose'

function docker-sleep {
  docker run -d --name sleepingbeauty --entrypoint /bin/sleep $1 ${2:-1h}
}

function docker-start {
  open /Applications/Docker.app
}

function docker-reload {
  docker-stop
  docker-start
}

#   alias rebuild='docker-compose rm -f; docker-compose build && docker cache clean; docker-compose up'
#   docredo { docker clean all; docker-compose up -d }

function docker-exec { command docker exec -it $1 $2 }
function dxc {
  [[ ! -z "$1" ]] && _image=$(docker ps | grep $1 | awk '{print $1}')
  [[ -z "$1" ]] && _image=$(docker ps -l -q)
  docker-exec $_image bash || docker-exec $_image sh
}

function drun { command docker run -it $@; }
function dbounce { docker-compose rm -f && docker-compose up; }

echo "Loaded docker shortcuts"
