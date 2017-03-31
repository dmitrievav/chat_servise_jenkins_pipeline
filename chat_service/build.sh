#!/bin/sh

set -e
set -x

cd chat_service

# make a tag from specific repo branch or tag
TAG=$BUILD_NUMBER
IMAGE_NAME=chatservice
CONTAINER_NAME=ChatService-$TAG


# cleanup
rm -rf ./target


# make jar
#echo "FROM maven:3-jdk-8-onbuild-alpine" > Dockerfile
#docker build -t $IMAGE_NAME:$TAG .
#docker run -d --name $CONTAINER_NAME $IMAGE_NAME:$TAG sleep 120
#docker cp $CONTAINER_NAME:/usr/src/app/target ./
#docker rm -f $CONTAINER_NAME
#docker rmi $IMAGE_NAME:$TAG

docker run --rm \
  --name $CONTAINER_NAME -h $CONTAINER_NAME \
  -v "$PWD/m2_cache":/root/.m2 \
  -v "$PWD":/usr/src/mymaven \
  -w /usr/src/mymaven \
  maven:3-jdk-8-onbuild-alpine mvn clean install


# make a docker contatiner with jar
cat > Dockerfile <<-EOF
FROM openjdk:8-jdk-alpine
COPY target/ChatService*.jar /usr/src/myapp/ChatService.jar
WORKDIR /usr/src/myapp
CMD ["java", "-jar", "ChatService.jar", "de.affinitas.chat.service.ChatService"]
EOF
docker build -t $IMAGE_NAME:$TAG .


# upload target artifacts to some registry
#docker login -u $dockerhub_user -p $dockerhub_pass -e dm-alexey@ya.ru
docker tag $IMAGE_NAME:$TAG  dmitrievav/$IMAGE_NAME:$TAG
docker push dmitrievav/$IMAGE_NAME:$TAG
docker tag $IMAGE_NAME:$TAG  dmitrievav/$IMAGE_NAME:latest
docker push dmitrievav/$IMAGE_NAME:latest
