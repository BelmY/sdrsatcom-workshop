#!/bin/sh
#
# Copyright 2019 Lime Microsystems Ltd.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Commonly used tools, octave, preparation for installing LimeSuite
# sudo ./install.sh
pcmanfm --set-wallpaper="/usr/share/rpd-wallpaper/sand.jpg"
sudo apt-get install -y ssh
sudo apt-get install -y synaptic
sudo apt-get install -y gnuplot-x11
sudo apt-get install -y filezilla
sudo apt-get install -y nedit
sudo apt-get install -y git
sudo apt-get install -y cmake
sudo apt-get install -y meld # spot the difference between files.
sudo apt-get install -y fftw3-dev
sudo apt-get install -y xdg-utils
sudo apt-get install -y autoconf # turbofec lime-tools
sudo apt-get install -y libtool
sudo apt-get install -y minicom # serial coms
sudo apt-get install -y screen # serial coms
sudo apt-get install -y lm-sensors # intel compatibility
sudo apt-get install -y libsensors4-dev # intel compatibility
sudo apt-get install -y nmap # find unknown IP for ssh to portsdown
sudo apt-get install -y zenmap
sudo add-apt-repository ppa:myriadrf/drivers #packages for soapysdr available at myriadrf PPA
sudo apt-get update
sudo apt-get install -y libsqlite3-dev # core library and build dependencies
sudo apt-get install -y libi2c-dev # hardware support dependencies
sudo apt-get install -y libusb-1.0-0-dev
sudo apt-get install -y libwxgtk3.0-dev freeglut3-dev # graphics dependencies
sudo apt-get install -y libsoapysdr-dev 
sudo apt-get install -y soapysdr 
sudo apt-get install -y soapysdr-module-lms7
sudo apt-get install -y network-manager
sudo apt-get install -y network-manager-gnome # set up of static IP address if required



