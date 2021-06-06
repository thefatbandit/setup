#!/bin/bash
cwd=$(pwd)

greet()
{
    printf "************************************************************\n\n"
    echo "Hi" $USER
    printf "You are running Installation Scripts by TheFatBandit (with blatant copying from KaLiMaLi555)"
    printf "\n\n************************************************************\n\n"
}

get_permission()
{
    ## Reading for mode of installation
    read -p "Do you want to install $1 [Y/n]: " default
    if [[ "$default" == "" ]]
        then
            default="Y"
    fi
    if [[ "$default" =~ [Y|y] ]]
    then
        return 1
    else
        return 0
    fi
}
# Update System\
update_sys()
{
    sudo apt-get update -y
    sudo apt-get upgrade -y
}


# Useful Tertiary Apps
install_useful()
{
    update_sys
    # Are you even dev-ops if you don't have these?
    sudo apt install git -y
    sudo apt install vim -y
    update_sys

    echo -en "\n\nInstalling Snap\n\n"
    sudo apt install snapd -y    
   
    # Slack + Discord
    echo -en "\n\nInstalling Discord\n\n"
    sudo snap install discord --classic -y
    
    echo -en "\n\nInstalling Slack\n\n"
    sudo snap install slack --classic -y

    echo -en "\n\nInstalling Flameshot (For Screenshots)\n\n"
    sudo snap install flameshot -y

    update_sys
    sudo apt-get install p7zip-full -y
}

# -------------------------------------------------------------------------------------
# Script Start

greet
get_permission "Default"

if [[ "$?" =~ [1] ]]
then
    echo "Proceeding with default settings ..."
    update_sys

    # Installing some useful packages
    install_useful

    # Installing Apt-fast wrapper
    echo -en "\n\nInstalling apt-fast wrapper\n\n"
    cd apt_fast
    bash install_aptfast.sh
    cd $cwd

    # Installing sublime and sublime merge
    echo -en "\n\nInstalling Sublime Test & Sublime Merge\n\n"
    cd sublime
    bash install_sublime.sh
    cd $cwd

    # Installing Docker
    echo -en "\n\nInstalling Docker\n\n"
    cd docker
    bash install_docker.sh
    cd $cwd

    # Installing VS Code
    echo -en "\n\nInstalling VS Code\n\n"
    sudo snap install --classic code

    # Installing Brave Browser
    echo -en "\n\nInstalling Brave Browser\n\n"
    cd brave
    bash install_brave.sh
    cd $cwd

    echo -en "\n\nWriting aliases to .bashrc\n\n"
    echo "alias sds='source devel/setup.bash'" >> ~/.bashrc

else
    echo "Proceeding with custom settings ..."
    update_sys

    # Installing some useful packages
    install_useful

    # Permission for apt-fast installation
    get_permission "apt-fast wrapper"
    if [[ "$?" =~ [1] ]]
        then
            echo -en "\n\nInstalling apt-fast wrapper\n\n"
            cd apt_fast
            bash install_aptfast.sh
            cd $cwd
    fi

    # Permission for sublime installation
    get_permission "Sublime Text & Sublime Merge"
    if [[ "$?" =~ [1] ]]
        then
            echo -en "\n\nInstalling Sublime Test & Sublime Merge\n\n"
            cd sublime
            bash install_sublime.sh
            cd $cwd
    fi

    # Permission for vscode installation
    get_permission "Visual Studio Code"
    if [[ "$?" =~ [1] ]]
        then
            echo -en "\n\nInstalling Visual Studio Code\n\n"
            sudo snap install --classic code
    fi

    # Permission for docker installation
    get_permission "Docker"
    if [[ "$?" =~ [1] ]]
        then
            echo -en "\n\nInstalling Docker\n\n"
            cd docker
            bash install_docker.sh
            cd $cwd
    fi

    # Permission for Brave Browser
    get_permission "Brave Browser"
    if [[ "$?" =~ [1] ]]
        then
            echo -en "\n\nInstalling Brave Browser\n\n"
            cd brave
            bash install_brave.sh
            cd $cwd
    fi
fi


echo -en "\n\nSome Other packages (permission will be asked for each)\n\n"
# Permission for installing ros
get_permission "ROS"
if [[ "$?" =~ [1] ]]
then
    echo -en "\n\nInstalling ROS\n\n"
    cd ros
    bash install_ros.sh
    cd $cwd
fi

get_permission "OpenCV"
if [[ "$?" =~ [1] ]]
then
    echo -en "\n\nInstalling Opencv\n\n"
    cd opencv
    bash install_opencv.sh
    cd $cwd
fi

get_permission "Anaconda"
if [[ "$?" =~ [1] ]]
then
    echo -en "\n\nInstalling Anaconda\n\n"
    cd anaconda
    bash install_anaconda.sh
    cd $cwd
fi


