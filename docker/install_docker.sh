#!/bin/bash

## Updating system
update_sys()
{
    sudo apt-get update -y
    sudo apt-get upgrade -y
}

## Installing apt-fast wrapper
install_docker()
{
    sudo apt-get remove docker docker-engine docker.io containerd runc
    update_sys
    sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    update_sys
    sudo apt-get install docker-ce docker-ce-cli containerd.io        

    echo -en "\n\nWriting aliases 'docker_restart' into .bashrc\n\n"
    echo "alias docker_restart='sudo systemctl restart docker.service'" >> ~/.bashrc
}

add_docker_to_sudo()
{
    sudo groupadd docker
    sudo usermod -aG docker $USER
    newgrp docker 
    docker run hello-world
}

install_docker
echo -en "\n\nAdding docker to sudo group\n\n"
add_docker_to_sudo

echo -en "\n\nInstalling nvidia-docker-runtime\n\n"
sudo apt-get install nvidia-container-runtime -y
sudo tee /etc/docker/daemon.json <<EOF
{
    "default-runtime": "nvidia"
    "runtimes": {
        "nvidia": {
            "path": "/usr/bin/nvidia-container-runtime",
            "runtimeArgs": []
        }
    }
}
EOF 
sudo pkill -SIGHUP dockerd
