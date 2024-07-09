# Ubuntu-Custom-Image
Creation of a custom ubuntu image with ccs-cli pre installed onto the ubuntu image

<h2>Cloning, CD, and making the image</h2>

    git clone https://github.com/canonical/packer-maas.git
    git clone https://github.com/Quintin-Falk/ubuntu-custom-image-ccs-cli.git
    cd packer-maas/ubuntu
    rm ubuntu-cloudimg.pkr.hcl
    cd
    mv ubuntu-custom-image-ccs-cli/ubuntu-cloudimg.pkr.hcl packer-maas/ubuntu
    cd packer-maas/ubuntu
    sudo make custom-cloudimg.tar.gz SERIES=jammy
