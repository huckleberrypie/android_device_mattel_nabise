 #!/bin/bash
 cd ../../../..
 cd frameworks/av
 patch -p1 < ../../device/mattel/nabise/patches/frameworks/av/0002-Implement-MediaTek-Camera-Support.patch
 patch -p1 < ../../device/mattel/nabise/patches/frameworks/av/0003-MediaTek-Fix-Microphone.patch
echo This is ugly.