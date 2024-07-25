#!/bin/sh

NVIDIA_VERSION=560.28.03
wget https://download.nvidia.com/XFree86/Linux-x86_64/$NVIDIA_VERSION/NVIDIA-Linux-x86_64-$NVIDIA_VERSION.run -O download/NVIDIA-Linux-x86_64-$NVIDIA_VERSION.run
echo
echo "Now 'sudo su' and start installation:"
echo "  Proprietaty: sh download/NVIDIA-Linux-x86_64-$NVIDIA_VERSION.run"
echo "  Open Source-Published: sh download/NVIDIA-Linux-x86_64-$NVIDIA_VERSION.run -m=kernel-open"
