# https://hub.docker.com/_/centos/
# If you want to checck official Library , the URL is here.
# https://hub.docker.com/search/?isAutomated=0&isOfficial=0&page=1&pullCount=0&q=library%2Fcent&starCount=0
#Simply Image Setup
docker pull <version>
docker images

#Specific Image Setup
#Firstly, you should write DockerFile, and change directory to uncompose images.
docker build -t <account/image_name> .

#create container, create only
docker create -it --name <name> <image_name>
#create container, create and run
docker run -it --name <name> <image_name>
#remove container
docker rm <name,containerID>

#check status
docker ps -a

#start container
docker start <containerID>

#attach container, similar to login
docker attach <containerID>

#execution command
docker exec <containerID> <command>
#Also you want to leave the container running when deattaching it.
docker exec <containerID> /bin/bash

#you upload the image
docker tag <image:tag> <account/image:[tag]>
docker push <account/image>

#Reference : https://qiita.com/nimusukeroku/items/72bc48a8569a954c7aa2

