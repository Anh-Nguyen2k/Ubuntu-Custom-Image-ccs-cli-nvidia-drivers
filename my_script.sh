#!/bin/bash

#install necessary packages

sudo apt install qemu-utils libnbd-bin nbdkit fuse2fs qemu-system ovmf cloud-image-utils parted make git curl -y

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" -y

sudo apt-get update && sudo apt-get install packer -y

echo "packages installed"

#clone and copy the new hcl file from Ubuntu-Custom-Image-ccs-cli-nvidia-drivers into packer-maas/ubuntu directory

git clone https://github.com/canonical/packer-maas.git

git clone https://github.com/Quintin-Falk/Ubuntu-Custom-Image-ccs-cli-nvidia-drivers.git

cd packer-maas/ubuntu

sudo rm ubuntu-cloudimg.pkr.hcl

cd 

cd Ubuntu-Custom-Image-ccs-cli-nvidia-drivers

cp ubuntu-cloudimg.pkr.hcl ../packer-maas/ubuntu/

cd

cd packer-maas/ubuntu

echo "making image"

#make image

sudo make custom-cloudimg.tar.gz SERIES=jammy
