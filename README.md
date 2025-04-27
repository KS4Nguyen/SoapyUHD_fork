# Soapy SDR plugins for UHD devices

## Forked from SoapyUHD

* https://github.com/pothosware/SoapyUHD
* Staying in sync with the original upstream

## Dependencies

* UHD - https://github.com/EttusResearch/uhd/wiki
* SoapySDR - https://github.com/pothosware/SoapySDR/wiki
* boost libraries - http://www.boost.org/

## Build status on origin

- Travis: [![Travis Build Status](https://travis-ci.org/pothosware/SoapyUHD.svg?branch=master)](https://travis-ci.org/pothosware/SoapyUHD)

## Fork

This fork of SoapyUHD has the goal to solve an Ubuntu PPA package conflict beween
- EttusUHD - ubuntu __'universe'__ first installed, then installed gnu-radio via sudo apt
- SoapyUHD - ubuntu __'noble'__ later installed according to:
        https://github.com/pothosware/PothosCore/wiki/Ubuntu

Both gnu-radio apps with uhd from 'universe' and Pothosware SDR-projects with uhd 'noble' should detect and run the usrp

> Both SoapySDR and the Universal Hardware Driver by Ettus Research projects provide libraries to access various software defined radio hardware through a common interface.

The answer to solve the conflict is hidden in output of:

* sudo apt show uhd-host uhd-soapysdr soapysdr-module-uhd

__SoapyUHD__
 
Package: uhd-soapysdr
Version: 0.4.1-4build4
Priority: optional
Section: __universe__/hamradio
Source: soapyuhd

> This UHD module makes all SoapySDR devices available to applications using libuhd. An interface in the other direction is available in the soapysdr-module-uhd package


Package: soapysdr-module-uhd
Version: 0.4.1-4build4
Priority: optional
Section: __universe__/hamradio
Source: soapyuhd

This SoapySDR hardware support module makes all UHD devices available to applications using SoapySDR. An interface in the other direction is available in the uhd-soapysdr package.

This is an empty dependency package that pulls in the UHD module for the default version of libsoapysdr.

__EttusUHD__

Package: uhd-host
Version: 4.6.0.0+ds1-5.1ubuntu0.24.04.1
Priority: optional
Section: __universe__/science



1. Introduction to SDR approaches

Software Defined Radios (SDR) are hightly flexible hardware frontends that unlease their full potential of flexible bandwiths and scalable datarates/types with SDR-specific drivers, abstraction layers and programming language libraries that provide unified interfaces

- multi-language/multi-platform support
- SDKs and IDEs.

The user can design their own individual aplications by creating flowgraphs and connecting scalable generic functional blocks that implement filters, modulators/demodulators, enduser interfaces. The signal-processing can be designed in an SDKs programming language.or GUI namely:

- Pothosware Framework
- GNU-Radio


2. From top down: Pothosware Framework

The [Pothos dataflow programming software suite](https://github.com/pothosware) approaches the SDRs dataflow as absolut-hardware independed  generic blackbox module.

[SoapySDR] (https://github.com/pothosware/SoapySDR/wiki#id15) abstracts the hardware by modulizing the RF/HF signal processing 
- control flow
- data type- and rate conversion 

    from the hardware layer by
    * interfacing vendor specifc device modules and
    * importing the UHD drivers for the specific hardware

    to end application SoapySDR provides
    * interfaces to Porthos SDK
    * APIs to gnu-radio by wrapping
        * osmosdr to gr-osmosdr
        * uhd to gr-uhd
        
        https://github.com/pothosware/SoapySDR/wiki#gnu-radio


3. Bottom-Up: Ettus-USRP and the UHD

For the ettus-usrp radio transceiver Ettus Research published and maintains:
- uhd-host and
- hardwware drivers in libuhd (and libuhd-dev)

When installing gnu-radio on Ubuntu workstation before SoapyUHD, gnu-radio refers to the libuhd-dev und-host by installing the uhd PPAs from __'universe'__


4. SoapyUHD

> http://i.imgur.com/m6ihRGz.png The Pothosware Framework PPA contains debian packages for the Pothos framework and various Pothos toolkits **Soapy SDR and > a slew of hardware support drivers are provided by the MyriadRF SDR Drivers PPA.**
> The PPAs support the following Ubuntu releases:
>
>     Focal (20.04 LTS)
>      * Source: https://github.com/pothosware/PothosCore/wiki/Ubuntu

Depending on the targeted SDR hardware and individual needs some of these PPAs are required for the Pothos Framework, some are optional. They are released in Ubuntu __'noble'__ PPAs.

> __required__ for Framework / toolkits and libraries:
> > sudo add-apt-repository -y ppa:pothosware/framework
> > sudo add-apt-repository -y ppa:pothosware/support
> 
> __optional__ hardware support for SoapySDR, and drivers:
> > sudo add-apt-repository -y ppa:myriadrf/drivers
>
> __optional__ hardware support for the Ettus-USRP that depends 
> > sudo add-apt-repository -y ppa:ettusresearch/uhd

After the packages are made available to Ubuntu they have to be installed. For detailed information about installations refor to
https://github.com/pothosware/PothosCore/wiki/Ubuntu


5. To not mix it up

* UHD driver support for Ettus-USRP and also supplies the soapysdr, and drivers (optional)

from https://launchpad.net/~pothosware/+archive/ubuntu/framework/+packages

> A PPA upload script from provides the built packages
> 
> __soapysdr-uhd__ Soapy UHD - UHD devices for Soapy SDR.
> __uhd-soapysdr__ Soapy UHD - Soapy SDR devices for UHD.

    soapyuhd (0.3.0-myriadrf2~vivid
    Published on 2016-01-17
    * Source: https://launchpad.net/~myriadrf/+archive/ubuntu/drivers/+sourcepub/5967441/+listing-archive-extra

> Ubuntu https://ppa.launchpadcontent.net/pothosware/framework/ubuntu 
> lib-uhd and uhd-host from 'noble' with 'universe'


## Documentation

* https://github.com/pothosware/SoapyUHD/wiki

## Licensing information

* GPLv3: http://www.gnu.org/licenses/gpl-3.0.html
