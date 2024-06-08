#!/bin/sh

NVIDIA_VERSION=555.52.04
wget https://download.nvidia.com/XFree86/Linux-x86_64/$NVIDIA_VERSION/NVIDIA-Linux-x86_64-$NVIDIA_VERSION.run
echo
echo "Now 'sudo su' and start installation:"
echo "  Proprietaty: sh ./NVIDIA-Linux-x86_64-$NVIDIA_VERSION.run"
echo "  Open Source-Published: sh ./NVIDIA-Linux-x86_64-$NVIDIA_VERSION.run -m=kernel-open"
