#!/bin/bash

# Ask user for swap size
read -p "Enter the amount of swap space you want (in GB): " swapsize

# Convert GB to MB
swapsize=$((swapsize * 1024))

# Swap enabling
sudo swapoff /swapfile 2>/dev/null
sudo rm -f /swapfile


sudo fallocate -l ${swapsize}M /swapfile
if [ $? -ne 0 ]; then
    echo "fallocate failed. Trying dd instead."
    sudo dd if=/dev/zero of=/swapfile bs=1M count=${swapsize}
fi


sudo chmod 600 /swapfile


sudo mkswap /swapfile


sudo swapon /swapfile


if ! grep -q "/swapfile" /etc/fstab; then
    echo "/swapfile none swap sw 0 0" | sudo tee -a /etc/fstab
fi


free -h


echo "\n✅ Swap space of ${swapsize}MB has been successfully created and enabled."
