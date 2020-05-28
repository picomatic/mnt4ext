#!/bin/sh
unzip $1

sudo apt install -y simg2img
sudo apt install -y android-tools-fsutils

simg2img system.img system.raw
simg2img vendor.img vendor.raw
simg2img product.img product.raw

mkdir system
mkdir system/vendor
mkdir system/product

sudo mount -t ext4 -o loop system.raw system/
sudo mount -t ext4 -o loop vendor.raw system/vendor
sudo mount -t ext4 -o loop product.raw system/product

echo "now run this in your device folder:"
echo ./extract-files.sh `pwd`
