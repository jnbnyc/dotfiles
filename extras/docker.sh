# docker shortcuts + functions

# Use DOCKER_OPTS to modify the daemon startup options.
DOCKER_OPTS="--dns 127.0.1.1 --dns 8.8.8.8"


alias compose='docker-compose'

function docker-sleep {
    docker run -d  --name sleepingbeauty --entrypoint /bin/sleep $1 ${2:-1h}
}

function docker-start() {
    docker-machine start ${1:-buhay-12}
    eval $(docker-machine env ${1:-buhay-12})
}

function docker-reload() {
  docker-stop
  docker-start
}

function ds {
  toggle=$(docker-machine active)
  case "$toggle" in
    buhay-12)
      docker-stop
    ;;
    *)
      docker-start
    ;;
  esac
  }

#   alias rebuild='docker-compose rm -f; docker-compose build && docker cache clean; docker-compose up'
#   docredo() { docker clean all; docker-compose up -d }

function dock {
    set -x
    if [[ "$1" == "clean" ]]; then
    # functions for docker cleanup
      if [[ "$2" == "all" ]]; then
        docker kill $(docker ps -a -q)  # kill all
        docker rm $(docker ps -a -q)  ## rm all
      else  # remove images matching the grep
        docker images | grep $2 | awk '{print $3}' | xargs docker rmi
      fi
      echo Deleting dangling images
      docker rmi $(docker images -q --no-trunc --filter "dangling=true") || true

      echo Deleting dangling volumes
      docker volume rm $(docker volume ls -q --filter "dangling=true") || true
    else
      if [[ "$1" != "exec" ]] && [[ "$2" != "-it" ]]; then
        echo $@ | xargs docker  # throws error: "cannot enable tty mode on non tty input" for docker exec
      else
        printf "Use dxc alias: $(which dxc)"
      fi
    fi
    set +x
  }

function docker-exec { command docker exec -it $1 $2 }
function  dxc {
    [[ ! -z "$1" ]] && _image=$(docker ps | grep $1 | awk '{print $1}')
    [[ -z "$1" ]] && _image=$(docker ps -l -q)
    docker-exec $_image bash || docker-exec $_image sh
}

function drun { command docker run -it $@; }
function dbounce { docker-compose rm -f && docker-compose up; }

function setup-docker {
  #export DOCKER_TLS_VERIFY="1"
  if docker-machine status default | grep Running; then
          eval $(docker-machine env default)
          export DOCKER_HOST_IP=$(docker-machine ip default)
  elif docker-machine status buhay-12 | grep Running; then
    eval $(docker-machine env buhay-12)
    export DOCKER_HOST_IP=$(docker-machine ip buhay-12)  # $(echo $DOCKER_HOST|grep -oP "(\d+\.){3}\d+")
  elif docker-machine status docker | grep Running; then
    eval $(docker-machine env docker)
  elif docker-machine status machine | grep Running; then
    eval $(docker-machine env machine)
  else
    echo "Docker daemon not running."
  fi
}

# setup-docker

echo "Loaded docker shortcuts"
