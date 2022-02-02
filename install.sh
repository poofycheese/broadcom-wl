#!/bin/bash
echo "Making broadcom-wl.  Sudo Login..."
sudo make clean
sudo make

echo "Make Install"
sudo make install

echo "Loading kernal module"
sudo depmod -A
sudo modprobe wl

echo "Reset DKMS to rebuild"
sudo dkms remove --all broadcom-wl/6.30.223.271
sudo dkms add broadcom-wl/6.30.223.271
sudo dkms status

echo "Make Clean"
sudo make clean
echo "Done." 