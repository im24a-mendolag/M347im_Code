#!/bin/bash
#
# Deploy files to AWS EC2 instance
# Modify the variables below to match your setup
#
PRIVATE_KEY="C:/ims/bzz/347/mendolag.pem"
DEST="ubuntu@ec2-54-152-76-174.compute-1.amazonaws.com"
DIR="~/06"

# Create target directory on EC2
echo "Creating directory ${DIR} on ${DEST} ..."
ssh -i "${PRIVATE_KEY}" "${DEST}" "mkdir -p ${DIR}"

# Copy files to EC2
echo "Copying files to ${DEST}:${DIR} ..."
scp -i "${PRIVATE_KEY}" a01.yaml "${DEST}:${DIR}/"
scp -i "${PRIVATE_KEY}" test.sh  "${DEST}:${DIR}/"

echo "Done! SSH into your instance with:"
echo "  ssh -i \"${PRIVATE_KEY}\" ${DEST}"
