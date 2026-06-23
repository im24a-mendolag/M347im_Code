#!/bin/bash
#
PORT=4000

function setupEnv(){
  # Activate venv outside this script
  local path="$(pwd)/venv"
  printf "Copy&paste command: %s\n" \
    "source ${path}/bin/activate" \
    "pip install -r requirements.txt"
}

function runApp(){
  local app=$1
  if [ ! -f "${app}" ]
    then
    # show appropriate error
    echo "Error: Python-App as argument is required: <app.py>"
    echo "Exit script."
    exit 1
  fi
  echo "run $app ..."
  flask --app "$app" run --host=127.0.0.1 --port=${PORT}
  # echo "run $app in background"
}

function callURL(){
  local args="-f -s -S -k"
  local HOST="http://localhost:${PORT}"
  printf "%s\n" "Call frist app without any appointments ..."
  curl ${args} -X GET ${HOST}/
  echo ""
  sleep 2
  printf "%s\n" "Set an appointment ..."
  curl ${args} -X POST -H "Content-Type: application/json" \
    -d '{"salutation":"Herr","firstname":"Levin","lastname":"Weiss","appointment":"2026-06-10 09:00"}' \
    ${HOST}/api/termin
  echo ""
  sleep 2
  printf "%s\n" "Show the appointment ..."
  curl ${args} -X GET ${HOST}/api/termine
  echo ""
}

# Clear screen
clear
# Ask user for action and read it
read -p "Appointement App: set-[u]p environment, [r]un app, [t]est requests: " action
action=$(echo $action | tr '[A-Z]' '[a-z]')
# show selected action
echo "Your selection : $action"
# case/switch
case $action in
u)
  printf "\n---------\nSETUP ENV\n---------\n"
  setupEnv
  printf "\n\n"
  ;;
r)
  printf "\n---------\nRUN APP\n---------\n"
  runApp app.py
  printf "\n\n"
  ;;
t)
  printf "\n---------\nCALL URL\n---------\n"
  callURL
  printf "\n\n"
  ;;
*)
  echo "Incorrect action entered!"
  exit 1
  ;;
esac
