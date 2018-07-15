# Installation of Docker
brew cask install virtualbox
brew install docker
brew install docker-machine
# If you uncomment this, docker may waste your extra disk.
# brew cask docker

# VM setup
# In MaC, there is no Linux Kernel.
# So, Firstly, VM is needed to setup. 
docker-machine create --driver virtualbox test-docker
docker-machine ls
#check VM
docker-machine status test-docker
#test VM
docker-machine ssh test-docker
