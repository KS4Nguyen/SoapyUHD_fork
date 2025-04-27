#!/bin/sh
# soapysdr_util

sudo apt update
sudo apt install -y git cmake g++ libboost-all-dev libgmp-dev libusb-1.0-0-dev
sudo apt install -y soapysdr-tools

# modul installation
sudo apt install -y soapysdr-module-all

# install uhd-usrp only:
#sudo apt install -y soapysdr-module-usrp ## deprecated and replaced by:
sudo apt install -y soapy-modul-uhd

# python bindings
sudo apt install python3-soapysdr python3-numpy

# Test hardware connected

# 	SoapySDRUtil --probe
#	SoapySDRUtil --find

######################################################
##     Soapy SDR -- the SDR abstraction library     ##
######################################################

#[INFO] [UHD] linux; GNU C++ version 13.3.0; Boost_108300; UHD_4.8.0.0-0ubuntu1~noble1
#Found device 0
#  driver = uhd
#  label = B210 30AA010
#  name = 2000501840016
#  product = B210
#  serial = 30AA010
#  type = b20
# 

