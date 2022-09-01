#!/bin/bash

SCRIPT_DIR=$(dirname -- "$0")

cd /tmp

wget -q "https://github.com/libthinkpad/apindex/archive/refs/tags/2.2.zip"
7z x 2.2.zip
cd apindex-2.2

# Patch file to allow custom title
patch -Np1 --ignore-whitespace -i "$SCRIPT_DIR/apindex.patch"

# Use arch icon for packages
cp "$SCRIPT_DIR/package.png" ./share/apindex/img/package.png

cmake . -DCMAKE_INSTALL_PREFIX=/usr
make install
