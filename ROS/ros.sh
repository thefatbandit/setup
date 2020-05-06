#!/bin/bash

## 1.1 Configure your Ubuntu repositories
# Configure your Ubuntu repositories to allow "restricted," "universe," and "multiverse." 
# 	You can follow the Ubuntu guide: 
# 		https://help.ubuntu.com/community/Repositories/Ubuntu

## 1.2 Setup your sources.list
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

## 1.3 Set up your keys
sudo apt-key adv --keyserver 'hkp://pgp.mit.edu:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

## 1.4 Installation
sudo apt update

sudo apt install ros-melodic-desktop -y

# 1.5 Environment setup
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc

# 1.6 Dependencies for building packages
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
sudo apt install python-rosdep
sudo rosdep init
rosdep update