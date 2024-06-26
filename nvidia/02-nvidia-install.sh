#!/bin/sh

#Detection
sudo nala update
sudo aptitude install -t unstable nvidia-detect

lspci -nn | egrep -i "3d|display|vga"
nvidia-detect

# Nvidia driver
sudo aptitude install -t unstable nvidia-driver nvidia-smi nvidia-settings nvitop 
sudo cp ./nvidia-options.conf /etc/modprobe.d

# Power Management for Gnome
TMPL_PATH=.
sudo install --mode 644 "${TMPL_PATH}/system/nvidia-suspend.service" /etc/systemd/system
sudo install --mode 644 "${TMPL_PATH}/system/nvidia-hibernate.service" /etc/systemd/system
sudo install --mode 644 "${TMPL_PATH}/system/nvidia-resume.service" /etc/systemd/system
sudo install "${TMPL_PATH}/system-sleep/nvidia" /lib/systemd/system-sleep
sudo install "${TMPL_PATH}/nvidia-sleep.sh" /usr/bin
sudo systemctl enable nvidia-suspend.service
sudo systemctl enable nvidia-hibernate.service
sudo systemctl enable nvidia-resume.service

# Set GBM mode for Wayland
sudo cp ./99-nvidia-gbm.conf /etc/environment.d

# CUDA
sudo aptitude install -t unstable nvidia-cuda-dev nvidia-cuda-toolkit
# OptiX Ray-Tracing
sudo aptitude install -t unstable libnvoptix1
