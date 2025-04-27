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

sudo apt-get install libuhd-dev uhd-host # see (1) and (2)

# 
# Install from source with source
#

git@github.com:EttusResearch/uhd.git

# 
# And follow installation instructions here:
#	https://files.ettus.com/manual/page_install.html
# 


exit 0


Package: soapysdr0.8-module-uhd
Version: 0.4.1-4build4
Priority: optional
Section: universe/hamradio
Source: soapyuhd
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Debian Hamradio Maintainers <debian-hams@lists.debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 187 kB
Provides: soapysdr0.8-module
Depends: libc6 (>= 2.32), libgcc-s1 (>= 3.3.1), libsoapysdr0.8 (>= 0.8.1), libstdc++6 (>= 13.1), libuhd4.6.0 (>= 4.6.0.0+ds1)
Homepage: https://github.com/pothosware/SoapyUHD/wiki
Download-Size: 63,8 kB
APT-Manual-Installed: no
APT-Sources: http://de.archive.ubuntu.com/ubuntu noble/universe amd64 Packages
Description: UHD device support for SoapySDR
 Both SoapySDR and the Universal Hardware Driver by Ettus Research projects
 provide libraries to access various software defined radio hardware through a
 common interface.
 .
 This SoapySDR hardware support module makes all UHD devices available to
 applications using SoapySDR. An interface in the other direction is available
 in the uhd-soapysdr package.

Package: uhd-soapysdr
Version: 0.4.1-4build4
Priority: optional
Section: universe/hamradio
Source: soapyuhd
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Debian Hamradio Maintainers <debian-hams@lists.debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 429 kB
Depends: libc6 (>= 2.38), libgcc-s1 (>= 3.3.1), libsoapysdr0.8 (>= 0.8.1), libstdc++6 (>= 13.1), libuhd4.6.0 (>= 4.6.0.0+ds1)
Homepage: https://github.com/pothosware/SoapyUHD/wiki
Download-Size: 113 kB
APT-Sources: http://de.archive.ubuntu.com/ubuntu noble/universe amd64 Packages
Description: SoapySDR device support for libuhd
 Both SoapySDR and the Universal Hardware Driver by Ettus Research projects
 provide libraries to access various software defined radio hardware through a
 common interface.
 .
 This UHD module makes all SoapySDR devices available to applications using
 libuhd. An interface in the other direction is available in the
 soapysdr-module-uhd package.

Package: soapysdr-module-uhd
Version: 0.4.1-4build4
Priority: optional
Section: universe/hamradio
Source: soapyuhd
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Debian Hamradio Maintainers <debian-hams@lists.debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 6.144 B
Depends: soapysdr0.8-module-uhd (= 0.4.1-4build4)
Homepage: https://github.com/pothosware/SoapyUHD/wiki
Download-Size: 1.018 B
APT-Sources: http://de.archive.ubuntu.com/ubuntu noble/universe amd64 Packages
Description: UHD device support for SoapySDR (default version)
 Both SoapySDR and the Universal Hardware Driver by Ettus Research projects
 provide libraries to access various software defined radio hardware through a
 common interface.
 .
 This SoapySDR hardware support module makes all UHD devices available to
 applications using SoapySDR. An interface in the other direction is available
 in the uhd-soapysdr package.
 .
 This is an empty dependency package that pulls in the UHD module for the
 default version of libsoapysdr.

Package: soapysdr-tools
Version: 0.8.1-4build1
Priority: optional
Section: universe/hamradio
Source: soapysdr
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Debian Hamradio Maintainers <debian-hams@lists.debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 105 kB
Depends: libc6 (>= 2.38), libgcc-s1 (>= 3.3.1), libsoapysdr0.8 (>= 0.8.1), libstdc++6 (>= 13.1)
Homepage: https://github.com/pothosware/SoapySDR/wiki
Download-Size: 36,0 kB
APT-Manual-Installed: no
APT-Sources: http://de.archive.ubuntu.com/ubuntu noble/universe amd64 Packages
Description: software defined radio interface library tools
 SoapySDR is a library providing a common interface to SDR (software
 defined radio) hardware. Support for different hardware is added through
 external modules.
 .
 This package contains the SoapySDRUtil command line utility which can
 list available modules and hardware.

Package: libsoapysdr0.8
Version: 0.8.1-4build1
Priority: optional
Section: universe/libs
Source: soapysdr
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Debian Hamradio Maintainers <debian-hams@lists.debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 337 kB
Depends: libc6 (>= 2.38), libgcc-s1 (>= 3.3.1), libstdc++6 (>= 13.1)
Recommends: soapysdr0.8-module-all | soapysdr0.8-module
Homepage: https://github.com/pothosware/SoapySDR/wiki
Download-Size: 107 kB
APT-Manual-Installed: no
APT-Sources: http://de.archive.ubuntu.com/ubuntu noble/universe amd64 Packages
Description: software defined radio interface library
 SoapySDR is a library providing a common interface to SDR (software
 defined radio) hardware. Support for different hardware is added through
 external modules.
 .
 Dieses Paket enthält die Laufzeitbibliothek.

Package: libgnuradio-soapy3.10.9t64
Version: 3.10.9.2-1.1ubuntu2
Priority: optional
Section: universe/libs
Source: gnuradio
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: A. Maitland Bottoms <bottoms@debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 358 kB
Provides: libgnuradio-soapy3.10.9 (= 3.10.9.2-1.1ubuntu2)
Depends: libc6 (>= 2.32), libfmt9 (>= 9.1.0+ds1), libgcc-s1 (>= 3.3.1), libgnuradio-pmt3.10.9t64 (>= 3.10.9.2), libgnuradio-runtime3.10.9t64 (>= 3.10.9.2), libsoapysdr0.8 (>= 0.8.1), libspdlog1.12-fmt9, libstdc++6 (>= 13.1)
Breaks: libgnuradio-soapy3.10.9 (<< 3.10.9.2-1.1ubuntu2)
Replaces: libgnuradio-soapy3.10.9
Homepage: https://www.gnuradio.org/
Download-Size: 104 kB
APT-Manual-Installed: no
APT-Sources: http://de.archive.ubuntu.com/ubuntu noble/universe amd64 Packages
Description: gnuradio SoapySDR support
 Soapy hardware drivers using the SoapySDR driver framework.
 Part of the main gnuradio build.

Package: libsoapysdr-doc
Version: 0.8.1-4build1
Priority: optional
Section: universe/doc
Source: soapysdr
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Debian Hamradio Maintainers <debian-hams@lists.debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 3.007 kB
Homepage: https://github.com/pothosware/SoapySDR/wiki
Download-Size: 208 kB
APT-Sources: http://de.archive.ubuntu.com/ubuntu noble/universe amd64 Packages
Description: SoapySDR library development documentation
 SoapySDR is a library providing a common interface to SDR (software
 defined radio) hardware. Support for different hardware is added through
 external modules.
 .
 This package contains the development documentation for the library.

Package: python3-soapysdr
Version: 0.8.1-4build1
Priority: optional
Section: universe/python
Source: soapysdr
Origin: Ubuntu
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Original-Maintainer: Debian Hamradio Maintainers <debian-hams@lists.debian.org>
Bugs: https://bugs.launchpad.net/ubuntu/+filebug
Installed-Size: 1.699 kB
Depends: python3 (<< 3.13), python3 (>= 3.12~), python3:any, libc6 (>= 2.38), libgcc-s1 (>= 3.3.1), libsoapysdr0.8 (>= 0.8.1), libstdc++6 (>= 13.1)
Recommends: python3-numpy
Homepage: https://github.com/pothosware/SoapySDR/wiki
Download-Size: 413 kB
APT-Sources: http://de.archive.ubuntu.com/ubuntu noble/universe amd64 Packages
Description: SoapySDR Python 3 bindings
 SoapySDR is a library providing a common interface to SDR (software
 defined radio) hardware. Support for different hardware is added through
 external modules.
 .
 This package contains the Python 3 bindings for the library.

