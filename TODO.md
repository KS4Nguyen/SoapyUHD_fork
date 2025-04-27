#!/bin/bash

1. INFO

This document describes the dependencies and installation steps to ensure
compatibility for Ettus-uhd drivers with SoapyUHD on Ubuntu.

Application --> SoapyUHD --> SDR Hardware-Driver --> Physical SDR

Therefore, a plugin called SoapySDR is used.


2. DEPENDENCIES

* SoapyUHD needs
  ** SoapySDR needs
    *** UHD-Ettus-USRP
  ** SoapySDR Ettus-uhd headers and libraries in filesystem.

The installation steps are bottom-up.

In case libuhd-dev uhd-host are installed already from PPA, Ettus-uhd has to be
purged first ('noble' release) and reinstalled from 'multiverse'.

Use: install.uhd.sh

In addition, SoapyUHD can provide UHD binding for SoapySDR, such that SoapySDR supported devices can be used within the gr-uhd source/sink blocks. Users must ensure that the SoapyUHD support module is installed in UHD's module search path. Read more: https://github.com/pothosware/SoapyUHD/wiki#soapy-devices-in-uhd


3. INSTALLATIONS

TODO:
> Check dependencies and track environment:
>	CPP_VERSION = ''
>	PYTHON_VERSION = ''
>	PDIR = '~/projects'
>	LIBUHD = '' or 'noble' or 'universe'

# List of Dependencies

* C++14
* Python-dev
* numpy
* WIG


## Python Check

TODO:
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

TODO:
> Test if "sudo"
> Test if libuhd-dev uhd-host present in filesystem
>	(Env-Variables provided from source/lib)
>	LIBUHD = '' or 'noble' or 'universe'

## Ettus-USRP
We need:
- pip
- libBoost
- libUSB
- numpy


### Replace possible pre-installed uhd from 'noble' with 'universe'

TODO: Make order in this TODO.md correct

a. Test if ppa:ettusresearch/uhd is already installed from 'universe':
	> Get PPA source information
	> Check if installed
	>	skip b.

b. Test if ppa:ettusresearch/uhd is already installed from 'universe'
	> Get PPA source information
	> Check if installed
	> 	skip c.

c. install_uhd.sh

> sudo apt-get update
> sudo apt-get install -y libuhd-dev uhd-host

Ettus installation instructions:
	https://files.ettus.com/manual/page_install.html

TODO: What to do python Wheel installation?

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


# Install SoapyUHD

Building SoapyUHD: https://github.com/pothosware/SoapyUHD/wiki#soapy-devices-in-uhd

> cd $PDIR
> git clone https://github.com/pothosware/SoapyUHD.git
> cd SoapyUHD
> mkdir build
> cd build
> cmake ..
> make
> sudo make install


# Installation Checks

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
