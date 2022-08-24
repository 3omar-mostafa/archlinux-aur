#!/bin/bash

SCRIPT_DIR=$(dirname -- "$0")

git apply $SCRIPT_DIR/PKGBUILD.patch
sed -i "s:{{NM_PATCH_DIR}}:$SCRIPT_DIR:g" PKGBUILD
sed -i "s:options=(debug):options=(lto):g" PKGBUILD
