#!/bin/bash
cwd=$(pwd)

## Git
sudo apt install git -y


## Vim (Comment if you don't want)
# 	Apoorve
sudo apt install vim -y


## Discord (Uncomment if you want)
# sudo snap install discord


## Sublime Text + Merge
cd sublime
./sublime_text.sh
./sublime_merge.sh
cd cwd 

## openCV
# It currently sets up in the home directory
cd opencv
./opencv.sh
cd cwd


## ROS melodic
# desktop version (not full)  
cd ROS
./ros.sh

cd cwd