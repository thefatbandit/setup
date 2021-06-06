#!/bin/bash

## Updating system
update_sys()
{
    sudo apt-get update -y
    sudo apt-get upgrade -y
}

## Installing sublime
install_sublime()
{
    sudo apt install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"
    update_sys
    sudo apt install sublime-text -y
}

## Installing sublime merge
install_sublimemerge()
{
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    sudo apt-get install apt-transport-https
    update_sys
    sudo apt-get install sublime-merge -y
}

update_sys
install_sublime
install_sublimemerge
