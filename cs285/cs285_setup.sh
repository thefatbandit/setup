#!/bin/bash

echo "First arg: $1"
# Cloning Homework: 
echo "========	 Cloning Assignments Repo 	========="
cd ~
git clone https://github.com/berkeleydeeprlcourse/homework_fall2019.git

# ================================================================================================================
# Installing MujoCo (If mjkey.txt is present in ~/Downloads):
echo "========	 Installing MuJoCo 	========="

# Setting Up MuJoCo
cd ~
mkdir .mujoco
cd ~/homework_fall2019/hw1/downloads
cp -r mjpro150 ~/.mujoco

# Adding License Key
cd ~/Downloads
cp mjkey.txt ~/.mujoco/mjpro150.bin
echo $'\nexport LD_LIBRARY_PATH="$HOME/.mujoco/mjpro150/bin:$LD_LIBRARY_PATH"' >> ~/.bashrc 

# ================================================================================================================
# Anaconda Installation
#   Uncomment the next lines if you want to install Anaconda also
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

# ================================================================================================================
# Installing Other Dependencies

# Setting Up Conda Env
echo "========	 Setting Up Conda Env 	========="
conda create -n cs285 python=3.5
conda activate cs285
python --version

# Installing mujoco-py
echo "========	 Installing mujoco-py 	========="
cd ~
wget https://nero-mirror.stanford.edu/pypi/packages/d5/ce/b1f4962dcaf84a5ee4b943d9486e73f115978d69507ebe9abcc023c03f64/mujoco-py-1.50.1.35.tar.gz
tar -xf mujoco-py-1.50.1.35.tar.gz
cd ~/mujoco-py-1.50.1.35/
python setup.py install

# Making change to requirements.txt
sudo apt-get update -y
sudo apt-get install -y sed
cd ~/homework_fall2019/hw1/
sed -i '3s/./# &/' requirements.txt

# Installing Other Dependencies
echo "========	 Installing Other Dependencies 	========="
pip install --user --requirement requirements.txt
pip insatll -e .

echo "========	 Setup Successfull 	========="
