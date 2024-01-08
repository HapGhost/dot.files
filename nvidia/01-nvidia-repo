#!/bin/bash
curl -fSsL https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/3bf863cc.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/nvidia-drivers.gpg > /dev/null 2>&1
echo 'deb [signed-by=/usr/share/keyrings/nvidia-drivers.gpg] https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/ /' | sudo tee /etc/apt/sources.list.d/nvidia-drivers.list
sudo aptitude update
sudo aptitude install nvidia-detect linux-headers-amd64

lspci -nn | egrep -i "3d|display|vga"
nvidia-detect
# Nvidia driver
sudo aptitude install nvidia-driver nvidia-smi nvidia-settings firmware-misc-nonfree 
sudo cp ./nvidia-options.conf /etc/modeprobe.d
### DMA Buffers / IOMMU (https://us.download.nvidia.com/XFree86/Linux-x86_64/525.147.05/README/dma_issues.html)
### experimental add 'nvidia-drm.fbdev=1' below for >545.x.x driver
sudo su
echo 'GRUB_CMDLINE_LINUX="$GRUB_CMDLINE_LINUX nvidia-drm.modeset=1 nvidia-drm.fbdev=1 iommu=memaper mem_sleep_default=deep"' > /etc/default/grub.d/nvidia-modeset.cfg
update-grub
exit
TMPL_PATH=.
sudo install --mode 644 "${TMPL_PATH}/system/nvidia-suspend.service" /etc/systemd/system
sudo install --mode 644 "${TMPL_PATH}/system/nvidia-hibernate.service" /etc/systemd/system
sudo install --mode 644 "${TMPL_PATH}/system/nvidia-resume.service" /etc/systemd/system
sudo install "${TMPL_PATH}/system-sleep/nvidia" /lib/systemd/system-sleep
sudo install "${TMPL_PATH}/nvidia-sleep.sh" /usr/bin
sudo systemctl enable nvidia-suspend.service
sudo systemctl enable nvidia-hibernate.service
sudo systemctl enable nvidia-resume.service

# CUDA
sudo aptitude install nvidia-cuda-dev nvidia-cuda-toolkit
# OptiX Ray-Tracing
sudo aptitude install libnvoptix1
