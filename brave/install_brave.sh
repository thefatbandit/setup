#!/bin/bash

## Updating system
update_sys()
{
    sudo apt-get update -y
    sudo apt-get upgrade -y
}

## Installing Breve Browser
install_brave()
{
    sudo apt install -y apt-transport-https curl 
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    update_sys
    sudo apt install -y brave-browser -y
}

install_brave