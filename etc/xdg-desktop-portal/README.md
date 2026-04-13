This should be placed under `/usr/share/xdg-desktop-portal`

## Why? 

Aparently _xdg-desktop-portal-hyprland_ does not handle theme switching for **GTK4 applications** well. For example if you switch to light theme, _xdg-desktop-portal-hyprland_ won't handle `org.gnome.desktop.interface color-scheme` property change properly (as I understand). So instead, this config file sets _xdg-desktop-portal-gtk_ as preferred one, making it handle such things
