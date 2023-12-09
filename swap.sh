#!/bin/bash
fallocate -l 1G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "\n /swapfile swap swap defaults 0 0" >> /etc/fstab
