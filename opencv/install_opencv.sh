#!/bin/bash

## Updating system
update_sys()
{
    sudo apt-get update -y
    sudo apt-get upgrade -y
}

make_virtualenv()
{
    sudo pip3 install virtualenv virtualenvwrapper
    echo "# Virtual Environment Wrapper"  >> ~/.bashrc
    echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
    source ~/.bashrc
    mkvirtualenv cv-py3 -p python3
    workon cv-py3
}

install_dependencies()
{
    sudo apt-get remove x264 libx264-dev -y
    sudo apt-get install build-essential checkinstall cmake pkg-config yasm -y
    sudo apt-get install git gfortran -y
    sudo apt-get install libjpeg8-dev -y
    sudo apt-get install libtiff5-dev -y
    sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev -y
    sudo apt-get install libxine2-dev libv4l-dev -y
    sudo apt-get install qt5-default libgtk2.0-dev libtbb-dev -y
    sudo apt-get install libatlas-base-dev -y
    sudo apt-get install libfaac-dev libmp3lame-dev libtheora-dev -y
    sudo apt-get install libvorbis-dev libxvidcore-dev -y
    sudo apt-get install libopencore-amrnb-dev libopencore-amrwb-dev -y
    sudo apt-get install x264 v4l-utils -y
    sudo apt-get install libprotobuf-dev protobuf-compiler -y
    sudo apt-get install libgoogle-glog-dev libgflags-dev -y
    sudo apt-get install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen -y --fix-missing
    sudo apt-get install python-dev python-pip python3-dev python3-pip -y
    sudo -H pip3 install -U pip numpy -y
    update_sys
    make_virtualenv
    sudo -H pip3 install numpy scipy matplotlib scikit-image scikit-learn ipython
    deactivate
}

# Check the opencv make flags according to usage
install_opencv()
{
    git clone https://github.com/opencv/opencv.git
    cd opencv
    git checkout 3.4.1
    cd ..
    git clone https://github.com/opencv/opencv_contrib.git
    cd opencv_contrib
    git checkout 3.4.1
    cd ..
    cd opencv
    mkdir build
    cd build
    cmake -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D INSTALL_C_EXAMPLES=ON \
        -D INSTALL_PYTHON_EXAMPLES=ON \
        -D WITH_TBB=ON \
        -D WITH_V4L=ON \
        -D WITH_QT=ON \
        -D WITH_OPENGL=ON \
        -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
        -D BUILD_EXAMPLES=ON \
        -D BUILD_opencv_xfeatures2d=OFF \
        -D WITH_CUDA=OFF ..
    make -j$(nproc)
    sudo make install
    sudo sh -c 'echo "/usr/local/lib" >> /etc/ld.so.conf.d/opencv.conf'
    sudo ldconfig
    ln -s $(find /usr/local/lib/ -type f -name "cv2*.so") ~/.virtualenvs/cv-py3/lib/python3.6/site-packages/cv2.so
}

update_sys
install_dependencies
install_opencv