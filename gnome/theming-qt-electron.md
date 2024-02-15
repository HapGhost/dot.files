### Electron apps in wayland

Add the following line to the exec line:

--enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=auto

--enable-features=UseOzonePlatform --ozone-platform-hint=auto

### qt theming
sudo aptitude install -t unstable qt5ct adwaita-qt adwaita-qt6

### above should set these environment variables
systemctl --user set-environment QT_STYLE_OVERRIDE=adwaita
systemctl --user set-environment QT_QPA_PLATFORMTHEME=qt5ct
