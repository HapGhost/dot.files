### Needed to enable DRM at part of kernel load
### DMA Buffers / IOMMU (https://us.download.nvidia.com/XFree86/Linux-x86_64/525.147.05/README/dma_issues.html)
### experimental add 'nvidia-drm.fbdev=1' below for >545.x.x driver

sudo su
echo 'GRUB_CMDLINE_LINUX="$GRUB_CMDLINE_LINUX nvidia-drm.modeset=1 iommu=memaper mem_sleep_default=deep"' > /etc/default/grubt.d/nvidia-modeset.cfg
update-grub
exit