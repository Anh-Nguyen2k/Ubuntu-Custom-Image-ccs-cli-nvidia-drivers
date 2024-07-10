# Ubuntu-Custom-Image
Creation of a custom ubuntu image with ccs-cli pre installed onto the ubuntu image

<h2>Installing necessary packages, Cloning, CD, and editing template</h2>

    sudo apt install qemu-utils libnbd-bin nbdkit fuse2fs qemu-system qemu-system-modules-spice ovmf cloud-image-utils parted make git
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    sudo apt-get update && sudo apt-get install packer
    git clone https://github.com/canonical/packer-maas.git
    cd packer-maas/ubuntu
    sudo nano ubuntu-cloudimg.pkr.hcl

<h2>Delete packer template in nano and insert code from link below</h2>

    https://raw.githubusercontent.com/Quintin-Falk/ubuntu-custom-image-ccs-cli/main/ubuntu-cloudimg.pkr.hcl

To save press ctr+o enter then ctr+x

<h2>make image and upload it to maas</h2>

    sudo make custom-cloudimg.tar.gz SERIES=jammy
    sudo maas admin boot-resources create \
        name='custom/ubuntu-tgz' \
        title='Ubuntu Custom TGZ' \
        architecture='amd64/generic' \
        filetype='tgz' \
        content@=custom-cloudimg.tar.gz
    

    
