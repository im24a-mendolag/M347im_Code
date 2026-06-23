#!/bin/bash
#
# set port
PORT=3000
# Clear screen
clear
# Ask user for action and read it
read -p "Check app (container [o]utside, [s]hutdown app, [w]atch process): " action
# show selected action
echo "Selected action: ${action}"
# case/switch
case ${action} in
o | outside)
  curl http://localhost:${PORT}/
  printf "\n\n"
  ;;
[s] | shutdown)
  curl http://localhost:${PORT}/shutdown
  printf "\n\n"
  ;;
w | watch)
  docker ps -a
  printf "\n\n"
  ;;
*)
  echo "Incorrect action entered!"
  exit 1
  ;;
esac
