#!/bin/bash

## Sublime Text
# Update the apt package list and install the dependencies necessary to fetch packages from https sources:
sudo apt update
sudo apt install apt-transport-https ca-certificates curl software-properties-common

# Import the repository’s GPG key using the following curl command:
curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

# Add the Sublime Text APT repository to your system’s software repository list by typing:
sudo add-apt-repository "deb https://download.sublimetext.com/ apt/stable/"

sudo apt update
sudo apt install sublime-text -y

