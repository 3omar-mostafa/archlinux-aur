#!/bin/bash

SCRIPT_DIR=$(dirname -- "$0")

patch -Np1 -i "$SCRIPT_DIR/PKGBUILD.patch"
sed -i "s:{{PWN_PATCH_DIR}}:$SCRIPT_DIR:g" PKGBUILD