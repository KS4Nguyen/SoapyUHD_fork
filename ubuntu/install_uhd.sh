#!/bin/bash
# SoapySDR https://github.com/pothosware/SoapyUHD/wiki

# 
#   !!! Important !!! 
#   This installation script does not run properly, follow the instructions
#   line-by-line.
# 

# To integrate UHD Drivers into SoapySDR API the UHD must be build and installed
# from source because SoapySDR needs UHD's lib:
# 
#   !!! Purge Debian PPA for Ettus-UHD !!!
# 

sudo apt-get update
sudo apt install -y ppa-purge

# 
# Remove the universal hardware driver for Ettus Research products
#   Package: libuhd-dev
#   Version: 4.8.0.0-0ubuntu1~noble1
# 

sudo apt-get update
sudo apt purge libuhd-dev uhd-host

# 
# Now remove the PPA from ubuntu:
#   URIs: https://ppa.launchpadcontent.net/ettusresearch/uhd/ubuntu/
#   Suites: noble
#   Components: main
# 
# Further information: https://launchpad.net/~ettusresearch/+archive/ubuntu/uhd
# 

sudo add-apt-repository --remove ppa:ettusresearch/uhd
sudo apt-get update

# 
# Replace the previously installed Ettus drivers from 'noble' with 'universe':
#	(1) headers for universal hardware driver for Ettus Research products
#
#	(2) host library for the Universal Hardware Driver for Ettus products
# 
#	(3) Ettus drivers from 'universe':
#		Package: libuhd-dev
#		Version: 4.6.0.0+ds1-5.1ubuntu0.24.04.1
#		Section: universe/libdevel
#		Source: uhd
# 
#	Homepage: https://www.ettus.com/sdr-software/uhd-usrp-hardware-driver/
# 

# Required for Pothos Framework / toolkits and libraries:
sudo add-apt-repository -y -s ppa:pothosware/framework
sudo add-apt-repository -y -s ppa:pothosware/support

# Reinstall hardware support for the Ettus-USRP that depends 
sudo add-apt-repository -y -s ppa:ettusresearch/uhd
sudo apt-get install -y libuhd-dev uhd-host

# 
# If everything fails: Install from source with source
#

# git clone git@github.com:EttusResearch/uhd.git

mkdir build
cd build
cmake ..
make
sudo make install

sudo apt install -y soapysdr-module-uhd
sudo apt install -y uhd-soapysdr

# And follow installation instructions here:
#	https://files.ettus.com/manual/page_install.html
# 

# Check if driver is installed
SoapySDRUtil --find

SoapySDRUtil --probe

# Probe usrp-b210 / b200
SoapySDRUtil --probe="driver=uhd,type=b200"

exit 0
