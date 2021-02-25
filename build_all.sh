#!/bin/bash

cd "$(dirname "$0")"

make -C es clean all
make -C fs clean all
make -C fs-usb clean all
make -C di clean all