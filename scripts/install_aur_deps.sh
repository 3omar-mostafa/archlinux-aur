#!/bin/bash

cd /tmp && git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin  && makepkg -si --noconfirm --clean

cd /tmp && git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin  && makepkg -si --noconfirm --clean

cd /tmp && git clone https://aur.archlinux.org/downgrade.git
cd downgrade  && makepkg -si --noconfirm --clean
