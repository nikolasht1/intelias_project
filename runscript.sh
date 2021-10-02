#!/bin/bash
echo "clone original repo"

git clone git@github.com:nikolasht1/cpp_test_app.git
echo "chench directory"

cd cpp_test_app
echo "make dockerfile"

cat <<EOF > Dockerfile
FROM alpine:latest

RUN apk update && apk add --no-cache g++

COPY main.cpp settings.conf /tmp/

WORKDIR /tmp/

RUN g++ -o Test main.cpp

CMD ["./Test"]
EOF
echo "make conf file"

cat <<EOF > settings.conf
Greeting = 'Hello from docker for the World!'
EOF
echo "build image"

sudo docker build . -t mycapp:v1
echo "run image"

sudo docker run --rm -it mycapp:v1
echo "login docker hub"

sudo docker login
echo "push image on docker hub"

sudo docker push nikolasht1/mycapp
echo "tasck finished!"
