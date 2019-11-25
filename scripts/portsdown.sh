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
# https://github.com/BritishAmateurTelevisionClub/portsdown
# https://wiki.batc.org.uk/The_Portsdown_Transmitter
# includes LimeSuite install
#
# ./portdown.sh
wget https://raw.githubusercontent.com/BritishAmateurTelevisionClub/portsdown/master/install.sh
chmod +x install.sh
./install.sh
#
# nmap 192.168.X.0/24 -T4 -F # to find device with only port 22 open.
# ssh pi@192.168.X.Y
# menu
# change output mode QPSKRF->LIMEMINI
# testcard or desktop
# 437MHz SR 250 FEC 3/4 LIMEMINI Gain 88


