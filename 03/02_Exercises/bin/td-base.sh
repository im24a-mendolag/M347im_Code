#!/bin/bash
#
if test $# -lt 1; then
  printf "%s\n" \
    "Error: Provide at least 1 argument:" \
    "(1): remove all, (2): remove only image" \
    "Exit script."
  exit 1
fi

function rmCont() {
  printf "Stop and remove container %s ..." ${container}
  docker stop ${container}
  sleep 2
  docker rm ${container}
  docker ps -a
}

function rmImg() {
  printf "Remove image %s ..." ${image}
  docker rmi ${image}
  sleep 1
  docker images
}

case $1 in
1)
  rmCont
  rmImg
  ;;
2)
  rmImg
  ;;
*)
  echo "Incorrect choice entered!"
  ;;
esac
