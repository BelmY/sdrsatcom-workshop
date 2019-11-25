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
# ./LeanSDR.sh
sudo apt-get install -y pkg-config
sudo apt-get install -y tstools
sudo apt-get install -y ffmpeg

git clone https://github.com/myriadrf/lime-tools.git
cd lime-tools
mkdir build
cd build
cmake ..
make
sudo make install
cd ../..

git clone http://github.com/pabr/leansdr.git
cd leansdr/src/apps
make
make embedded
cd ../../..

