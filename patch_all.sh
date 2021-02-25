#!/bin/bash

cd "$(dirname "$0")"

infile="${1:-0000000e.app}"

mkdir "build"
mkdir "build/temp"
mkdir "build/SNEEK"
mkdir "build/SNEEK-DI"
mkdir "build/UNEEK"
mkdir "build/UNEEK-DI"

echo --- --- Patching for SNEEK

echo --- With di
IOSKpatch/IOSKPatch "$infile" "build/temp/sd.app" -s -d
ELFIns/elfins "build/temp/sd.app" "build/SNEEK-DI/kernel.bin" "es/esmodule.elf" "fs/iosmodule.elf"
pushd "build/SNEEK-DI"
../../eFIX/efix "../../di/dimodule.elf"
popd
cp "es/font.bin" "build/SNEEK-DI"

echo --- Without di
IOSKpatch/IOSKPatch "$infile" "build/temp/s.app" -s
ELFIns/elfins "build/temp/s.app" "build/SNEEK/kernel.bin" "es/esmodule.elf" "fs/iosmodule.elf"
cp "es/font.bin" "build/SNEEK"

echo --- --- Patching for UNEEK

echo --- With di
IOSKpatch/IOSKPatch "$infile" "build/temp/ud.app" -u -d
ELFIns/elfins "build/temp/ud.app" "build/UNEEK-DI/kernel.bin" "es/esmodule.elf" "fs-usb/iosmodule.elf"
pushd "build/UNEEK-DI"
../../eFIX/efix "../../di-usb/dimodule.elf"
popd
cp "es/font.bin" "build/UNEEK-DI"

echo --- Without di
IOSKpatch/IOSKPatch "$infile" "build/temp/u.app" -u
ELFIns/elfins "build/temp/u.app" "build/UNEEK/kernel.bin" "es/esmodule.elf" "fs-usb/iosmodule.elf"
cp "es/font.bin" "build/UNEEK"