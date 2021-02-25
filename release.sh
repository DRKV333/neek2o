#!/bin/bash

cd "$(dirname "$0")"

mkdir "release"

mkdir "release/IOSKPatch"
cp "IOSKPatch/IOSKPatch" "release/IOSKPatch"
cp "IOSKPatch/IOSKPatch.exe" "release/IOSKPatch"

mkdir "release/ELFIns"
cp "ELFIns/elfins" "release/ELFIns"
cp "ELFIns/elfins.exe" "release/ELFIns"

mkdir "release/eFIX"
cp "eFIX/efix" "release/eFIX"
cp "eFIX/efix.exe" "release/eFIX"

mkdir "release/di"
cp "di/dimodule.elf" "release/di"

mkdir "release/di-usb"
cp "di-usb/dimodule.elf" "release/di-usb"

mkdir "release/es"
cp "es/esmodule.elf" "release/es"
cp "es/font.bin" "release/es"

mkdir "release/fs"
cp "fs/iosmodule.elf" "release/fs"

mkdir "release/fs-usb"
cp "fs-usb/iosmodule.elf" "release/fs-usb"

cp "patch_all.sh" "release"
cp "patch_all.cmd" "release"