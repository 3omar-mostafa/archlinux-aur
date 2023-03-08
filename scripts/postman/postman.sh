#!/bin/bash

SCRIPT_DIR=$(dirname -- "$0")

patch -Np1 --ignore-whitespace -i "$SCRIPT_DIR/PKGBUILD.patch"
sed -i "s/sha256sums_x86_64=(.*/sha256sums_x86_64=('SKIP'/g" PKGBUILD
sed -i "s/sha256sums_aarch64=(.*/sha256sums_aarch64=('SKIP'/g" PKGBUILD

