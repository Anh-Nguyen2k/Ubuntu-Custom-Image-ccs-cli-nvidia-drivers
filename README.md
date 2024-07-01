# Ubuntu-Custom-Image
Creation of a custom ubuntu image with ccs-cli pre installed onto the ubuntu image

<h2>Cloning, CD, and making the image</h2>

    git clone https://github.com/canonical/packer-maas.git
    git clone https://github.com/Quintin-Falk/Ubuntu-Custom-Image.git
    cd packer-maas/ubuntu
    rm ubuntu-cloudimg.pkr.hcl
    cd
    mkdir combined-repo
    mv packer-maas/ubuntu combined-repo/
    mv Ubuntu-Custom-Image/* combined-repo/
    mv Ubuntu-Custom-Image/.[^.]* combined-repo/ 2>/dev/null
    cd combined-repo
    sudo make custom-cloudimg.tar.gz SERIES=jammy
