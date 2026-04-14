#!/bin/bash
# Online-Source:  https://tinyurl.com/mint22-encryption / https://pastebin.com/raw/TJ1q363f
# setxkbmap de  (set German keyboard)
# sudo fdisk -l (make sure partitions are set right)
PBOOT=/dev/nvme0n1p5
PLUKS=/dev/nvme0n1p6

sudo mkfs.ext4 $PBOOT
sudo cryptsetup luksFormat $PLUKS
sudo cryptsetup luksOpen $PLUKS cryptmk
# sudo dd if=/dev/zero of=/dev/mapper/cryptmk bs=16M  # Unnecessary, takes forever
sudo pvcreate /dev/mapper/cryptmk
sudo vgcreate vgmk /dev/mapper/cryptmk
sudo lvcreate -n lvmkswap -L 16G vgmk
sudo lvcreate -n lvmkroot -l 100%FREE vgmk
sudo mkfs.ext4 /dev/mapper/vgmk-lvmkroot
sudo mkswap /dev/mapper/vgmk-lvmkswap
echo "============================================================================================="
echo "Now install Linux Mint graphically and DO NOT RESTART -----> Choose 'Continue testing'"
echo "- Assign /dev/mapper/vgmk-lvmkroot:          Use as: EXT4    Format: Yes Mount-Point: /"
echo "- Assign /dev/mapper/vgmk-lvmkswap           Use as: SWAP    Should be set automatically"
echo "- Assign /dev/nvme0n1p5 to /boot             Use as: EXT4    Format: Yes Mount-Point: /boot"
echo "- Set 'Device for boot loader installation: /dev/nvme0n1p5   Check size(!) Should be 4GB"
echo "============================================================================================="
read -p "Press Enter when installation is complete..."
sudo mount /dev/mapper/vgmk-lvmkroot /mnt/
sudo mount $PBOOT /mnt/boot/
sudo mount --bind /dev/ /mnt/dev/
echo "cryptmk UUID=$(sudo blkid -s UUID -o value $PLUKS) none luks,discard" | sudo tee -a /mnt/etc/crypttab
sudo chroot /mnt/ mount -t proc proc /proc/
sudo chroot /mnt/ mount -t sysfs sys /sys/
sudo chroot /mnt/ mount -t devpts devpts /dev/pts/
echo "Updating initramfs..."
sudo chroot /mnt/ update-initramfs -k all -c
echo "[Done]. You can reboot now."
