#!/bin/bash

# read -p "Configure network-shares? [y/n] " -n 1 -r
#  echo    # (optional) move to a new line
# if [[ $REPLY =~ ^[Yy]$ ]]
# then
    echo 'Configure network-shares...'
    CREDCIFS="/root/.cifs"
    NASIP='192.168.10.100'

    # create a credentials-file to mount the cifs-shares and secure the file
    echo "Creating a credentials-file: $CREDCIFS"
    echo 'username=xxxxxxxxxxxxxxxx'    | sudo tee -a $CREDCIFS
    echo 'password=xxxxxxxxxxxxxxxx'    | sudo tee -a $CREDCIFS
    sudo chown root:root $CREDCIFS
    sudo chmod 600 $CREDCIFS

    # create the mount-points for the cifs-shares (within the home of the user) - don't run this as root!
    echo 'Creating mount-points for the network-shares.'
    mkdir -p ~/NAS/home
    # mkdir -p ~/NAS/home-mkoflerAT/                            
    # mkdir -p ~/NAS/{backups,media,movies,music,series,software}

    # append necessary entries to permanently mount the shares via fstab
    echo "//$NASIP/home                 /home/$(whoami)/NAS/home                cifs uid=1000,credentials=$CREDCIFS,iocharset=utf8 0 0" | sudo tee -a /etc/fstab
    # echo "//$NASIP/homes/mkoflerAT      /home/$(whoami)/NAS/home-mkoflerAT      cifs uid=1000,credentials=$CREDCIFS,iocharset=utf8 0 0" | sudo tee -a /etc/fstab
    # echo "//$NASIP/homes/ldaine         /home/$(whoami)/NAS/home-ldaine         cifs uid=1000,credentials=$CREDCIFS,iocharset=utf8 0 0" | sudo tee -a /etc/fstab
    # echo "//$NASIP/backups              /home/$(whoami)/NAS/backups             cifs uid=1000,credentials=$CREDCIFS,iocharset=utf8 0 0" | sudo tee -a /etc/fstab
    # echo "//$NASIP/media                /home/$(whoami)/NAS/media               cifs uid=1000,credentials=$CREDCIFS,iocharset=utf8 0 0" | sudo tee -a /etc/fstab
    echo "//$NASIP/movies               /home/$(whoami)/NAS/movies              cifs uid=1000,credentials=$CREDCIFS,iocharset=utf8 0 0" | sudo tee -a /etc/fstab
    echo "//$NASIP/music                /home/$(whoami)/NAS/music               cifs uid=1000,credentials=$CREDCIFS,iocharset=utf8 0 0" | sudo tee -a /etc/fstab
    echo "//$NASIP/series               /home/$(whoami)/NAS/series              cifs uid=1000,credentials=$CREDCIFS,iocharset=utf8 0 0" | sudo tee -a /etc/fstab
    # echo "//$NASIP/software             /home/$(whoami)/NAS/software            cifs uid=1000,credentials=$CREDCIFS,iocharset=utf8 0 0" | sudo tee -a /etc/fstab
  
    echo "Network-shares should have been configured at your system."
    echo "Update username and password within the file $CREDCIFS by running:"
    echo '-----------------------------------------------------------------------'
    echo "sudo nano $CREDCIFS"
    echo '-----------------------------------------------------------------------'
    echo 'After you have saved the credentials file, mount the shares by running:'
    echo '-----------------------------------------------------------------------'
    echo 'sudo systemctl daemon-reload'
    echo 'sudo mount -a'
    echo '-----------------------------------------------------------------------'
    echo 'Now for all shares icon should appear on your desktop.'
    echo '-----------------------------------------------------------------------'
# else
#     echo '[Skipped] Configure network-shares'
# fi

