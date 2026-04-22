Why do I need these .desktop entries?

- `alacritty.desktop`: Just defines more explicitly that alacritty is the terminal used on your system, so whenever an application is trying to open something with the terminal, it will select alacritty

- `nvim.desktop`: I had a big problem with nvim - **whenever I tried to open a file**, instead of running nvim in the terminal, **it was spawned just as a background process**! This entry explicitly says that nvim should be executed inside of allacritty.

- `org.gnome.eog.desktop`: This entry adds `--fullscreen` argument to the eog, so when you open an image, it will automatically be opened in fullscreen.