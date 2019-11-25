#!/bin/bash
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
# https://github.com/f4exb/sdrangel/wiki/Compile-from-source-in-Linux
# ./installSDRangU.sh

# under developement - use at risk!
sudo apt-get install -y pkg-config
sudo apt-get update 
sudo apt-get -y install git cmake g++ pkg-config autoconf automake libtool libfftw3-dev libusb-1.0-0-dev libusb-dev qt5-default qtbase5-dev qtchooser libqt5multimedia5-plugins qtmultimedia5-dev libqt5websockets5-dev qttools5-dev qttools5-dev-tools libqt5opengl5-dev qtbase5-dev libboost-all-dev libasound2-dev pulseaudio libopencv-dev libxml2-dev bison flex ffmpeg libavcodec-dev libavformat-dev libopus-dev
sudo apt-get install pavucontrol

git clone https://github.com/f4exb/cm256cc.git
cd cm256cc
git reset --hard f21e8bc1e9afdb0b28672743dcec111aec1d32d9
mkdir build
cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/cm256cc ..
make install

git clone https://github.com/szechyjs/mbelib.git
cd mbelib
git reset --hard 9a04ed5c78176a9965f3d43f7aa1b1f5330e771f
mkdir build
cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/mbelib ..
make install

git clone https://github.com/f4exb/serialDV.git
cd serialDV
git reset --hard "v1.1.4"
mkdir build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/serialdv ..
make install

git clone https://github.com/f4exb/dsdcc.git
cd dsdcc
git reset --hard "v1.8.6"
mkdir build; cd build
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/dsdcc -DUSE_MBELIB=ON -DLIBMBE_INCLUDE_DIR=/opt/install/mbelib/include -DLIBMBE_LIBRARY=/opt/install/mbelib/lib/libmbe.so -DLIBSERIALDV_INCLUDE_DIR=/opt/install/serialdv/include/serialdv -DLIBSERIALDV_LIBRARY=/opt/install/serialdv/lib/libserialdv.so ..
make install

sudo apt-get -y install libspeexdsp-dev libsamplerate0-dev

git clone https://github.com/drowe67/codec2.git
cd codec2
git reset --hard 76a20416d715ee06f8b36a9953506876689a3bd2
mkdir build_linux; cd build_linux
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/codec2 ..
make install

git clone https://github.com/pothosware/SoapySDR.git
cd SoapySDR
git reset --hard "soapy-sdr-0.7.1"
mkdir build; cd build
cmake -DCMAKE_INSTALL_PREFIX=/opt/install/SoapySDR ..
make install

cd LimeSuite/builddir
cmake -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/install/LimeSuite -DCMAKE_PREFIX_PATH=/opt/install/SoapySDR ..
make install
cp /opt/install/LimeSuite/lib/SoapySDR/modules0.7/libLMS7Support.so /

sudo apt-get install libavahi-client-dev
git clone https://github.com/pothosware/SoapyRemote.git
cd SoapyRemote
git reset --hard "soapy-remote-0.5.1"
mkdir build; cd build
cmake -DCMAKE_INSTALL_PREFIX=/opt/install/SoapySDR -DSOAPY_SDR_INCLUDE_DIR=/opt/install/SoapySDR/include -DSOAPY_SDR_LIBRARY=/opt/install/SoapySDR/lib/libSoapySDR.so ..
make install

mkdir -p /opt/install/libsdrplay/include
mkdir /opt/install/libsdrplay/lib
cd /usr/local/include
sudo mv mirsdrapi-rsp.h /opt/install/libsdrplay/include
cd ../lib
sudo mv libmirsdrapi-rsp.so.2.13 /opt/install/libsdrplay/lib
sudo rm libmirsdrapi-rsp.so*
sudo chown -R user:users /opt/install/libsdrplay/include
sudo chown -R user:users /opt/install/libsdrplay/lib
cd /opt/install/libsdrplay/lib
ln -s libmirsdrapi-rsp.so.2.13 libmirsdrapi-rsp.so.2
ln -s libmirsdrapi-rsp.so.2 libmirsdrapi-rsp.so

cd /opt/build
git clone https://github.com/f4exb/sdrangel.git
cd sdrangel
mkdir build
cd build
cmake -Wno-dev -DDEBUG_OUTPUT=ON -DRX_SAMPLE_24BIT=OFF \
-DMIRISDR_DIR=/opt/install/libmirisdr \
#-DAIRSPY_DIR=/opt/install/libairspy \
#-DAIRSPYHF_DIR=/opt/install/libairspyhf \
#-DBLADERF_DIR=/opt/install/libbladeRF \
#-DHACKRF_DIR=/opt/install/libhackrf \
#-DRTLSDR_DIR=/opt/install/librtlsdr \
-DLIMESUITE_DIR=/opt/install/LimeSuite \
#-DIIO_DIR=/opt/install/libiio \
#-DPERSEUS_DIR=/opt/install/libperseus \
#-DXTRX_DIR=/opt/install/xtrx-images \
-DSOAPYSDR_DIR=/opt/install/SoapySDR \
-DCM256CC_DIR=/opt/install/cm256cc \
-DDSDCC_DIR=/opt/install/dsdcc \
-DSERIALDV_DIR=/opt/install/serialdv \
-DMBE_DIR=/opt/install/mbelib \
-DCODEC2_DIR=/opt/install/codec2 \
-DCMAKE_INSTALL_PREFIX=/opt/install/sdrangel ..
make install
