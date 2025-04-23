#!/bin/bash

1. INFO

This document describes the dependencies and installation steps for interfacing a Ettus-USRP with SoapyUHD.

Application --> SoapyUHD --> SDR Hardware-Driver --> Physical SDR

Therefore, a plugin called SoapySDR is used.


2. DEPENDENCIES

* SoapyUHD needs
  ** SoapySDR needs
    *** UHD-Ettus-USRP
* both SoapySDR and UHD-Ettus drivers with source-code (dev) and libraries in filesystem.
* the installation steps are bottom-up.

In addition, SoapyUHD can provide UHD binding for SoapySDR, such that SoapySDR supported devices can be used within the gr-uhd source/sink blocks. Users must ensure that the SoapyUHD support module is installed in UHD's module search path. Read more: https://github.com/pothosware/SoapyUHD/wiki#soapy-devices-in-uhd


3. INSTALLATIONS

CPP_VERSION = ''
PYTHON_VERSION = ''
PDIR = '~/projects'


# List of Dependencies

* C++14 / Python-dev / numpy / SWIG


## Python Check

> PYTHON_VERSION = $( python --version )
> if ( "$PYTHON_VERSION" == "python2" )
>   sudo apt-get install -y cmake g++ libpython-dev python-numpy swig
> else
>   sudo apt-get install -y cmake g++ libpython3-dev python3-numpy swig
> fi


## SWIG for python bindings

> sudo apt-get install -y swig

SWIG-Manpages for Python bindings:
  https://www.swig.org/Doc4.1/Python.html


## Test Environment

<TODO: Test if "sudo">
<TODO: Env-Variables here for source/lib


## Ettus-USRP
We need:
- pip
- libBoost
- libUSB
- numpy

### Remove installed PPA and provide libraries in file system
* This is to be reverted:
  > sudo add-apt-repository ppa:ettusresearch/uhd
  > sudo apt-get update
  > sudo apt-get install libuhd-dev uhd-host
  <TODO: Test existing installation and deinstall if so.>
* By this:
  > sudo apt-get install -y libuhd-dev uhd-host
  https://files.ettus.com/manual/page_install.html

To get the UHD version of the currently installed wheel, use:
> <python> -m pip show uhd

To get a list of available UHD Python Package versions on pypi.org, use the following command:
> <python> -m pip index versions uhd

To upgrade to the latest version, use:
> <python> -m pip install --upgrade uhd

To install a specific version, use:
> <python> -m pip install uhd==<version>


## Soapry SDR

* Maybe it is enough to install this package!
* Build SoapySDR from source:
    https://github.com/pothosware/SoapySDR/wiki/BuildGuide

> git clone https://github.com/pothosware/SoapySDR.git

### Update from an existing checkout
> cd SoapySDR.git
> git pull origin master
> mkdir build
> cd build
> cmake ..

> make -j`nproc`
> sudo make install -y -j`nproc`
> sudo ldconfig -y #needed on debian systems

> sudo make -j4
> sudo make install

Repeat this step for projects that depend on SoapySDR.


## SoapyUHD

Building SoapyUHD: https://github.com/pothosware/SoapyUHD/wiki#soapy-devices-in-uhd

> cd $PDIR
> git clone https://github.com/pothosware/SoapyUHD.git
> cd SoapyUHD
> mkdir build
> cd build
> cmake ..
> make
> sudo make install


exit


## Installation Checks

### Test Soapy in Python
info_soapy.py
> from gnuradio import soapy
>   # See the Doxygen documentation for details about the blocks available
>   # in this package. A quick listing of the details can be found in Python
>   # after importing by using:
> help(soapy)

### Find Ettus-USRP
> SoapySDRUtil --probe="driver=uhd,type=b200"
> SoapySDRUtil --probe="driver=uhd,type=b210"
