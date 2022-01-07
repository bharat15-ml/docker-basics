## this script will take IMAGE_NAME and TAG as a user input while building image


#!/bin/bash
IMAGE_NAME=$1
TAG=$2
REPO_NAME=$3

sudo docker build -t $IMAGE_NAME:$TAG -f Dockerfile .
sudo docker tag $IMAGE_NAME:$TAG $REPO_NAME/$IMAGE_NAME:TAG
sudo docker push $REPO_NAME/$IMAGE_NAME:TAG

echo "Image built and successfully and pushed to repository!!"

