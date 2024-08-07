# Ubuntu-Custom-Image
Creation of a custom ubuntu image with ccs-cli and cuda pre installed. This is all done in the maas shell that the image is being uploaded to.

<h2>Installing necessary packages, Cloning, CD, editing template, building image, uploading image</h2>

    sudo apt install qemu-utils libnbd-bin nbdkit fuse2fs qemu-system ovmf cloud-image-utils parted make git curl -y
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" -y
    sudo apt-get update && sudo apt-get install packer -y
    git clone https://github.com/canonical/packer-maas.git
    git clone https://github.com/Quintin-Falk/Ubuntu-Custom-Image-ccs-cli-nvidia-drivers.git
    cd packer-maas/ubuntu
    sudo rm ubuntu-cloudimg.pkr.hcl
    cd 
    cd Ubuntu-Custom-Image-ccs-cli-nvidia-drivers
    cp ubuntu-cloudimg.pkr.hcl ../packer-maas/ubuntu/
    cd
    cd packer-maas/ubuntu
    sudo make custom-cloudimg.tar.gz SERIES=jammy
    
    wget https://raw.githubusercontent.com/Quintin-Falk/Ubuntu-Custom-Image-ccs-cli-nvidia-drivers/main/ubuntu_cloudimg.sh && chmod +x ubuntu_cloudimg.sh && ./ubuntu_cloudimg.sh
    sudo maas admin boot-resources create \
        name='custom/ubuntu-tgz' \
        title='Ubuntu Custom TGZ' \
        architecture='amd64/generic' \
        filetype='tgz' \
        content@=custom-cloudimg.tar.gz
        
<h2>Might have to do this to ssh into the machine</h2>

    ssh-keygen -f "/home/ubuntu/.ssh/known_hosts" -R "<ip address of machine>"
    ssh ubuntu@<ip address of machine>

    
