# Soapy SDR plugins for UHD devices

## Build Status Origin

- Travis: [![Travis Build Status](https://travis-ci.org/pothosware/SoapyUHD.svg?branch=master)](https://travis-ci.org/pothosware/SoapyUHD)

## Description of this Fork

1. Introduction

This document describes the dependencies and installation steps to ensure
compatibility for Ettus-uhd drivers with SoapyUHD on Ubuntu 

Hardware Abstraction Overview

> Application --> SoapySDR --> SoapyUHD --> uhd --> Physical SDR


2. The problem

Ubuntu main/universe and Ubuntu main/noble divert in libuhd support.

The EttusUHD lowlevel libuhd-dev from 'universe' is not fitting 
the SoapyUHD generic driver libuhd-dev from 'noble".

- und_find_device
- uhd_usrp_probe
- SoapyUHD --probe

cannot access the RF/HF hardware front end depending what was installed first:

- ettus_uhd and gnu-radio
- soapysdr-module-uhd 

3. Temporar workaround

> 1. follow the installation instructions __install_soapysdr.sh__ and try to bring
>    the SoapyUHD ubuntu 'noble' step-by-step into 'universe'.
> 2. Execute __ubunutu/install_uhd.sh__ or follow its installation step-by-step
>    to override soapy_module_uhd with working libuhd from Ettus OR even better
>    install both as intended generate sym-links and conditional environment
>    solution with apt/ldconf, someting like that.

4. Possible long term fixes?

- Make .travis.yml work properly.
- Backport installation from universe to main fail for even more the more time goes by. Determine/Tag a "LTS uhd-version" of libuhd needed.

_Todo_ :

- Clean up documentation, write install_fixes.sh with consitency checkers, so the quick fix becomes fully automated.
- Talk to somebody about this issue.


## Documentation 

* SoapySDR generic driver needs

** SoapyUHD provides

   - soapysdr_module_uhd
   - __libhud__ (empty driver)

*** EttusUHD provides

    - __libuhd__ (living driver with acces
    
   to usrp-hardware, headers)

    - uhd-host

==> SoapySDR conflics in not getting libuhd from EttusUHD and headers.


* UHD - https://github.com/EttusResearch/uhd/wiki
* SoapySDR - https://github.com/pothosware/SoapySDR/wiki
* boost libraries - http://www.boost.org/

## Documentation

* https://github.com/pothosware/SoapyUHD/wiki

## Licensing information

* GPLv3: http://www.gnu.org/licenses/gpl-3.0.html
