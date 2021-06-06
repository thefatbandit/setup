#!/bin/bash

## Updating system
update_sys()
{
    sudo apt-get update -y
    sudo apt-get upgrade -y
}

## Installing apt-fast wrapper
install_aptfast()
{
    sudo add-apt-repository ppa:apt-fast/stable
    update_sys
    sudo apt-get -y install apt-fast -y
}

install_aptfast