#!/bin/bash

## Updating system
update_sys()
{
    sudo apt-get update -y
    sudo apt-get upgrade -y
}

install_ros()
{
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -
    update_sys
    sudo apt install ros-melodic-desktop-full
}

setup_ros()
{
    echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
    source ~/.bashrc
    sudo apt-get install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
    sudo apt-get install python-rosdep
    sudo rosdep init
    rosdep update
}

install_ros
setup_ros