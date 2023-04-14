#!/bin/bash

SCRIPT_DIR=$(dirname -- "$0")

patch -Np1 --ignore-whitespace -i "$SCRIPT_DIR/PKGBUILD.patch"
sed -i "s:{{PE_BEAR_PATCH_DIR}}:$SCRIPT_DIR:g" PKGBUILD
