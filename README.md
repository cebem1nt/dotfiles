# My dotfiles

## Info

- Panel: waybar
- All the menus (except notifications): rofi
- Notifications: swaync
- Terminal: alacritty
- Shell: zsh
- GTK theme: [kripton](https://github.com/EliverLara/Kripton)
- fetch: [mine :)](https://github.com/cebem1nt/sillyfetch)

Big thanks to this [collection of rofi themes](https://github.com/adi1090x/rofi)

## Structure
```
hypr # Hyprland configuration
├── configs
│   ├── animations.conf 
│   ├── binds.conf
│   ├── environ.conf
│   ├── exec.conf <- Startup scripts
│   ├── rules.conf <- Window/layer rules
│   └── settings.conf <- Misc settings
├── hypridle.conf
├── hyprland.conf <- Monitor configuration is here
├── hyprlock.conf
└── scripts
    ├── resize_gaps
    └── switch_layout
```

## Binds

#### Apps:
- `SUPER + ;` -> Open terminal
- `SUPER + n` -> Open browser
- `SUPER + m` -> Open vscodium
- `SUPER + b` -> Open thunar

#### Navigation:
- `SUPER + arrow keys` -> move focus in direction
- `SUPER + 1...6` -> go to workspace
- `SUPER SHIFT + 1...6` -> move to workspace
- `SUPER CTRL + 1...6` -> move & go to workspace
- `SUPER + s` -> toggle special workspace
- `SUPER SHIFT + s` -> move to special workspace

#### Actions
- `SUPER + q` -> close window
- `SUPER SHIFT + q` -> kill window 
- `SUPER + w` -> center window 
- `SUPER + f` -> toggle floating window 
- `SUPER SHIFT + f` -> fullscreen window 

#### Menus:
- `SUPER + r` -> Drun (app runner)
- `SUPER + t` -> Notification center
- `SUPER + v` -> Clipboard
- `SUPER + y` -> Wallpaper menu
- `SUPER + e` -> Filebrowser
- `SUPER SHIFT + r` -> Shell commands runner
- `SUPER SHIFT + e` -> Bookmarks menu

For more detailed info see `.config/hypr/configs/binds.conf`

## Installation

This installation assumes you have a minimal working system! Firstly install all the necessary packages acording to your distribution. On arch you can copy these:

```sh
sudo pacman -S hyprland hyprlock hypridle waybar swaync alacritty cava rofi peaclock pavucontrol thunar zsh
```

For spotify theme install [spicetify](), browser is [zen]() by default, you can change it in `.config/hypr/configs/binds.conf`.

Now clone & run the installer:

```sh
git clone https://github.com/cebem1nt/dotfiles.git
cd dotfiles
./install # Dont run as super user!
```

## Uninstallation
WIP

## Something doesnt work? 
Feel free to post an issue or contribute!

## Previews

![Image 1](previews/1.png)

![Image 2](previews/2.png)

![Image 3](previews/3.png)

![Image 4](previews/4.png)

![Image 5](previews/5.png)

![Image 6](previews/6.png)