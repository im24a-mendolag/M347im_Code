#!/bin/bash
#
YAML_FILE="a01.yaml"

function setup() {
    printf "%s\n" "Set docker compose ..."
    sudo apt install docker-compose
    sleep 1
    docker-compose --version
    docker-compose --help
}


function start(){
  printf "\n---------\n%s\n---------\n" "Docker-Compose start"
  printf "%s\n" "found yaml-files ..."
  ls *.yaml
  if [ ! -f "${YAML_FILE}" ]; then
    echo "Error: ${YAML_FILE} does not exist"
    exit 1
  fi
  printf "%s\n" "Starting containers ..."
  docker-compose -f "${YAML_FILE}" up -d
  sleep 2
  docker ps
  sleep 2
  printf "%s\n" "Containers started successfully."
}

function stop(){
  printf "\n---------\n%s\n---------\n" "Docker-Compose STOP"
  printf "%s\n" "found yaml-files ..."
  ls *.yaml
  if [ ! -f "${YAML_FILE}" ]; then
    echo "Error: ${YAML_FILE} does not exist"
    exit 1
  fi
  printf "%s\n" "Stopping and removing containers ..."
  docker-compose -f "${YAML_FILE}" down -v --remove-orphans
  sleep 2
  docker ps
  printf "\n\n"
}

function logs(){
  printf "\n---------\n%s\n---------\n" "Show logs"
  if ! docker ps --format '{{.Names}}' | grep -q "mysql_database"; then
    echo "Error: mysql_database is not running"
    exit 1
  fi
  if ! docker ps --format '{{.Names}}' | grep -q "wd_frontend"; then
    echo "Error: wd_frontend is not running"
    exit 1
  fi
  docker logs mysql_database --tail=15
  docker logs wd_frontend --tail=15
  printf "\n\n"
}

function process(){
  printf "\n---------\n%s\n---------\n" "Show process"
  if ! docker ps --format '{{.Names}}' | grep -q "mysql_database"; then
    echo "Error: mysql_database is not running"
    exit 1
  fi
  if ! docker ps --format '{{.Names}}' | grep -q "wd_frontend"; then
    echo "Error: wd_frontend is not running"
    exit 1
  fi
  docker top mysql_database
  docker top wd_frontend
  printf "\n\n"
}


# Clear screen
clear
# Ask user for action and read it
read -p "Docker-Compose: set-[u]p, [s]art, st[o]p, [l]ogs, [p]rocess: " action
action=$(echo $action | tr '[A-Z]' '[a-z]')
# show selected action
echo "Your selection : $action"
# case/switch
case $action in
  u) setup ;;
  s) start ;;
  o) stop ;;
  l) logs ;;
  p) process ;;
*)
  echo "Incorrect action entered!"
  exit 1
esac
