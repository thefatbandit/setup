#!/bin/bash

echo "First arg: $1"
echo "========	 Installing Carla	========="
# Link: https://carla.readthedocs.io/en/0.9.9/start_quickstart/
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 304F9BC29914A77D
sudo add-apt-repository "deb [arch=amd64 trusted=yes] http://dist.carla.org/carla-0.9.8/ all main"
sudo apt-get update -y
sudo apt-get install carla-simulator -y

if [$1 == 'install_conda']
then
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
	# TYPE y -> ENTER
fi

echo "========	Conda Env Setup	========="
conda create -n carla python=3.6 -y
source activate carla
pip install pygame numpy

echo "========	 Setup Successfull 	========="