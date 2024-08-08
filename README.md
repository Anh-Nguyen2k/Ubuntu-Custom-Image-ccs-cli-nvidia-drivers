# Ubuntu-Custom-Image
Creation of a custom ubuntu image with ccs-cli and cuda pre installed. This is all done in the maas shell that the image is being uploaded to.

<h2>Installing necessary packages, Cloning, CD, editing template, building image, uploading image</h2>

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

    
