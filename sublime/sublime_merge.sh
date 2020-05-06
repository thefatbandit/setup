#!/bin/bash

## Sublime Merge
# Install the GPG key: 
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

# Ensure apt is set up to work with https sources: 
sudo apt-get install apt-transport-https

# Select the channel to use: 
# 	Stable (comment for Dev):
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

#	Dev (uncomment for Dev):
# echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

# Update apt sources and install Sublime Merge 
sudo apt-get update
sudo apt-get install sublime-merge -y
