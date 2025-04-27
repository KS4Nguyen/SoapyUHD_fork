#!/bin/sh
# soapysdr_util

sudo apt update
sudo apt install -y git cmake g++ libboost-all-dev libgmp-dev libusb-1.0-0-dev
sudo apt install -y soapysdr-tools soapysdr-module-usrp

exit $?

# 
# Now you can install SoapyUHD_fork
#

mkdir build
cd build
cmake ..

if [ "$?" == "0" ]; then
	make
fi

if [ "$?" == "0" ]; then
	sudo make install
fi
