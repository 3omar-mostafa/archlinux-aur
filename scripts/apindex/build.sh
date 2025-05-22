#!/bin/bash

SCRIPT_DIR=$(dirname -- "$0")

cd /tmp

wget -q "https://github.com/jayanta525/apindex-v2/archive/refs/tags/v3.0-bootstrap.zip"
7z x v3.0-bootstrap.zip
cd apindex*

# Patch file to allow custom title
patch -Np1 --ignore-whitespace -i "$SCRIPT_DIR/apindex.patch"

# Use arch icon for packages
cp "$SCRIPT_DIR/package.png" ./share/apindex/img/package.png

cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5
make install
