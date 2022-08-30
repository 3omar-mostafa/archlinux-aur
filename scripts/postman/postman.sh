#!/bin/bash

SCRIPT_DIR=$(dirname -- "$0")

patch -Np1 --ignore-whitespace -i "$SCRIPT_DIR/PKGBUILD.patch"
sed -i "s/sha256sums=(.*/sha256sums=('SKIP'/g" PKGBUILD

