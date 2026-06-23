#!/bin/bash
#
# Pre requisit: scp (secure copy) must be installed on your notebook
# Check it with: scp /?
#
# Set variable for target node (your AWS EC2 instance)
DEST="ubuntu@ec2-34-228-228-203.compute-1.amazonaws.com"
# Set private key
KEY="C:/ims/bzz/347/mendolag.pem"
# check if private key is set
if [ -z "${KEY}" ]; then
  echo "Error: private key is not set"
  exit 1
fi
# Set variable for target directory where the app should be stored
DIR="~/01"

# remove (with ssh) target directory for the app
echo "Remove directory ${DIR} on ${DEST}"
ssh -i "${KEY}" "${DEST}" "rm -rf ${DIR}"
echo "Create directory ${DIR} on ${DEST}"
# create (with ssh) target directory for the app
ssh -i "${KEY}" "${DEST}" "mkdir -p ${DIR}"
# copy (with scp) all relevant bash script & Dockerfiles to destination
scp -i "${KEY}" 05_run.sh "${DEST}:${DIR}"
scp -i "${KEY}" 06_teardown.sh "${DEST}:${DIR}"
scp -i "${KEY}" Dockerfile2 "${DEST}:${DIR}"
