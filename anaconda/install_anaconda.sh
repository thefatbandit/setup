#!/bin/bash

## Updating system
update_sys()
{
    sudo apt-get update -y
    sudo apt-get upgrade -y
}

install_anaconda()
{
    sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6 -y
    cd /tmp
    wget https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh
    sha256sum Anaconda3-2021.05-Linux-x86_64.sh

    echo "Please check that the output value matches the following: "
    echo "2751ab3d678ff0277ae80f9e8a74f218cfc70fe9a9cdc7bb1c137d7e47e33d53  Anaconda3-2021.05-Linux-x86_64.sh"
    read -p "Press Enter to continue" </dev/tty

    bash Anaconda3-2021.05-Linux-x86_64.sh

    # 	  ************NOTE*****************
    # You'll have to press Enter etc. quite a no. of times
    # You'll have to type yes a couple of times. 
    # 	Looking for it's solution

    # Activate Installation
    source ~/.bashrc
    conda list

    # Update Conda
    conda update conda -y
    # TYPE y ENTER
}



install_anaconda
