#!/bin/bash
cwd=$(pwd)

# Update
sudo apt-get update -y
sudo apt-get upgrade -y

## Git
sudo apt install git -y

## Snap
sudo apt install snapd -y

## Vim (Comment if you don't want)
# 	Apoorve
sudo apt install vim -y

## Work media (Comment if you don't want)
sudo snap install discord

## Flameshot (The best screenshot app)
sudo snap install flameshot

# ===========================================================================
## Sublime Text + Merge
cd sublime
./sublime_text.sh
./sublime_merge.sh
cd cwd 

# ===========================================================================
## openCV
# It currently sets up in the home directory
cd opencv
./opencv.sh
cd cwd

# ===========================================================================
# Conda: https://www.digitalocean.com/community/tutorials/how-to-install-anaconda-on-ubuntu-18-04-quickstart#step-5-%E2%80%94-complete-installation-process
# Downloading the installation script
echo "========	 Installing Conda 	========="

cd /tmp
curl -O https://repo.anaconda.com/archive/Anaconda3-2020.02-Linux-x86_64.sh

# Verify the Data Integrity of the Installer
sha256sum Anaconda3-2020.02-Linux-x86_64.sh
echo "Please check that the output value matches the following: "
echo "2b9f088b2022edb474915d9f69a803d6449d5fdb4c303041f60ac4aefcc208bb  Anaconda3-2020.02-Linux-x86_64.sh"
read -p "Press Enter to continue" </dev/tty

# Run the Anaconda Script
bash Anaconda3-2020.02-Linux-x86_64.sh -y

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

# Install Occular PDF Viewer

cd cwd
# ===========================================================================
## ROS melodic
# desktop version (not full)  
cd ROS
./ros.sh

cd cwd