#!/bin/bash

sudo dnf install qemu qemu-img python3 python3-pip libvirt-client -y

(ls macOS.qcow2 >> /dev/null 2>&1 && echo "") || qemu-img create -f qcow2 macOS.qcow2 64G

./fetch-macOS-v2.py

(ls RecoveryImage.dmg >> /dev/null 2>&1 && mv RecoveryImage.dmg BaseSystem.dmg) || echo ""

qemu-img convert BaseSystem.dmg -O raw BaseSystem.img

sudo ./basic.sh
