#!/bin/bash

# Update
sudo apt-get update -y
sudo apt-get upgrade -y

# Installing Ubuntu Desktop
sudo apt-get install ubuntu-desktop -y

#adding a sudo user
sudo adduser demo
sudo usermod -aG sudo,adm demo

# ===========================================================================
# DISPLAY:
# Download the client in your Laptop
# Nomachine Client: https://www.nomachine.com/download/download&id=2
echo "========Installing NOMACHINE========="

# sudo -i


sudo apt-get update -y
sudo apt-get upgrade -y

echo "find PasswordAuthentication 'no' "
echo "change to 'yes', pres ESC to exit, and type :wq to save"
read -p "Press Enter to continue" </dev/tty
sudo -i vim /etc/ssh/sshd_config 

# Update
sudo apt update -y
sudo apt -y install wget
wget https://download.nomachine.com/download/6.12/Linux/nomachine_6.12.3_7_amd64.deb

sudo dpkg -i no*.deb
rm no*.deb

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



# ===========================================================================
# Carla

# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 304F9BC29914A77D
# sudo add-apt-repository "deb [arch=amd64 trusted=yes] http://dist.carla.org/carla-0.9.8/ all main"
# sudo apt-get update -y
# sudo apt-get install carla-simulator -y

# cd ~
# conda create -n carla python=3.6 -y
# source activate carla
# pip install pygame numpy

# sudo reboot