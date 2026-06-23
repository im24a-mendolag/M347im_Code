#!/bin/bash
#
function callURL(){
  local PORT=5000
  local args="-f -s -S -k"
  local URL="http://localhost:${PORT}"
  printf "%s\n" "Call frist app without any appointments ..."
  curl ${args} "${URL}/api/termine"
  echo ""
  sleep 2
  printf "%s\n" "Set an appointment ..."
  curl ${args} -X POST -H "Content-Type: application/json" \
    -d '{"salutation":"Mr","firstname":"Giovanni","lastname":"Mendola","appointment":"2026-06-10 09:00"}' \
    "${URL}/api/termin"
  echo ""
  sleep 2
  printf "%s\n" "Set a second appointment ..."
  curl ${args} -X POST -H "Content-Type: application/json" \
    -d '{"salutation":"Ms","firstname":"Anna","lastname":"Bauer","appointment":"2026-06-11 14:00"}' \
    "${URL}/api/termin"
  echo ""
  sleep 2
  printf "%s\n" "Show the appointment ..."
  curl ${args} "${URL}/api/termine"
  echo ""
}

# Clear screen
clear
# Ask user for action and read it
read -p "Appointement App: [t]est requests: " action
action=$(echo $action | tr '[A-Z]' '[a-z]')
# show selected action
echo "Your selection : $action"
# case/switch
case $action in
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
