#!/bin/bash

SCRIPT_DIR=$(dirname -- "$0")

patch -Np1 -i "$SCRIPT_DIR/PKGBUILD.patch"
sed -i "s:{{NM_PATCH_DIR}}:$SCRIPT_DIR:g" PKGBUILD
sed -i "s:options=(debug):options=(lto):g" PKGBUILD
