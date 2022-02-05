#!/bin/bash

MODULE=broadcom-wl
MODULE_VERSION=6.30.223.271


echo "Making $MODULE $MODULE_VERSION.  Sudo Login..."
sudo make clean
sudo make

echo "Make Install"
sudo make install

echo "Loading kernal module"
sudo depmod -A
sudo modprobe wl

echo "Set DKMS to rebuild with new kernals"
sudo dkms remove --all $MODULE/$MODULE_VERSION
sudo dkms build .
sudo dkms install $MODULE/$MODULE_VERSION
sudo dkms status

echo "Make Clean"
sudo make clean
echo "Done." 