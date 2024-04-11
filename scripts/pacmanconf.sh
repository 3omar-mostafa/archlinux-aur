#!/bin/bash


pacman-key --init

pacman -Syyu --noconfirm --color always

pacman -Sy --noconfirm --color always --needed bat pacman-contrib python-packaging

curl -s "https://archlinux.org/mirrorlist/?country=US&protocol=https&use_mirror_status=on" | sed -e 's/^#Server/Server/' -e '/^#/d' | rankmirrors -n 5 -
# pacman-mirrors --api --set-branch unstable
# pacman-mirrors --fasttrack

sed -i 's/#Color/Color/g' /etc/pacman.conf
sed -i 's/HoldPkg/#HoldPkg/g' /etc/pacman.conf
sed -i 's/IgnorePkg/#IgnorePkg/g' /etc/pacman.conf
sed -i 's/#VerbosePkgLists/VerbosePkgLists/g' /etc/pacman.conf

# # Enable multilib repos
# sed -i 's/#\[multilib\]/\[multilib\]/g' /etc/pacman.conf
# sed -i 's|#Include = /etc/pacman.d/mirrorlist|Include = /etc/pacman.d/mirrorlist|g' /etc/pacman.conf

echo '[options]' >> /etc/pacman.conf
echo 'ParallelDownloads = 5' >> /etc/pacman.conf
# echo 'XferCommand = /usr/bin/aria2c --allow-overwrite=true --continue=true --file-allocation=none --log-level=error --max-tries=3 --max-connection-per-server=2 --max-file-not-found=5 --min-split-size=5M --no-conf --remote-time=true --summary-interval=60 --timeout=50 --dir=/ --out %o %u' >> /etc/pacman.conf

bat --color always --pager=never /etc/pacman.conf -l conf
bat --color always --pager=never /etc/pacman.d/mirrorlist -l conf
