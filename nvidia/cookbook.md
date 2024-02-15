### PART I-2: NVIDIA DRIVER INSTALLATION (https://wiki.debian.org/NvidiaGraphicsDrivers)
#Packages: nvidia-driver nvidia-detect lspci linux-headers-amd64 ...
sudo aptitude update; \
sudo aptitude install -t unstable nvidia-detect linux-headers-amd64

lspci -nn | egrep -i "3d|display|vga"
nvidia-detect

sudo aptitude install -t unstable nvidia-kernel-dkms

sudo aptitude install -t unstable nvidia-driver nvidia-smi nvidia-settings firmware-misc-nonfree 

# CUDA
sudo aptitude install -t unstable nvidia-cuda-dev nvidia-cuda-toolkit
# OptiX Ray-Tracing
sudo aptitude install -t unstable libnvoptix1

### MUST DO!!!
### (https://wiki.debian.org/NvidiaGraphicsDrivers#Wayland) // Direct Rendering Manager Kernel Modesetting (DRM KMS)
### Power Management Support (https://us.download.nvidia.com/XFree86/Linux-x86_64/525.147.05/README/powermanagement.html)// /etc/modprobe.d/nvidia-options.conf (for debian distribution drivers)

micro /etc/modeprobe.d/nvidia-options.conf
-->
#options nvidia-current NVreg_DeviceFileUID=0 NVreg_DeviceFileGID=44 NVreg_DeviceFileMode=0660

# To grant performance counter access to unprivileged users, uncomment the following line:
#options nvidia-current NVreg_RestrictProfilingToAdminUsers=0

# Uncomment to enable this power management feature:
options nvidia-current NVreg_PreserveVideoMemoryAllocations=1

# Uncomment to enable this power management feature:
options nvidia-current NVreg_EnableS0ixPowerManagement=1
options nvidia-current NVreg_DynamicPowerManagement=0x02

# Enable Open Linux Kernel on GeForce and Workstation GPUs // obsolete in >545.x.x driver 
# options nvidia-current NVreg_OpenRmEnableUnsupportedGpus=1

# Enable GSP Firmware
options nvidia-current NVreg_EnableGpuFirmware=1
<--



### DMA Buffers / IOMMU (https://us.download.nvidia.com/XFree86/Linux-x86_64/525.147.05/README/dma_issues.html)
### experimental add 'nvidia-drm.fbdev=1' below for >545.x.x driver
sudo su
echo 'GRUB_CMDLINE_LINUX="$GRUB_CMDLINE_LINUX nvidia-drm.modeset=1 nvidia-drm.fbdev=1 iommu=memaper mem_sleep_default=deep"' > /etc/default/grub.d/nvidia-modeset.cfg
update-grub

sudo aptitude update; sudo aptitude install -t unstable \
  nvidia-vulkan-icd+M \
  nvidia-opencl-icd+M \
  nvidia-vaapi-driver+M \
  nvidia-vdpau-driver+M \
  libxcb1+M \
  libnvidia-egl-wayland1+M \
  xwayland+M \
  libgbm1+M \
  libnvidia-egl-gbm1+M \
  
### Optional Nvidia repo with newer beta drivers:
curl -fSsL https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/3bf863cc.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/nvidia-drivers.gpg > /dev/null 2>&1

echo 'deb [signed-by=/usr/share/keyrings/nvidia-drivers.gpg] https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/ /' | sudo tee /etc/apt/sources.list.d/nvidia-drivers.list

###
