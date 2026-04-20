# My dotfiles
My archlinux dotfiles, some scripts and wallpapers 

## Info

- Panel: waybar
- All the menus (except notifications): rofi
- Notifications: swaync
- Terminal: alacritty
- Shell: zsh
- Font: Cascadia Code
- GTK theme: [kripton](https://github.com/EliverLara/Kripton)
- Icon theme: [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- fetch: [mine :)](https://github.com/cebem1nt/sillyfetch)

Big thanks to this [collection of rofi themes](https://github.com/adi1090x/rofi)

## Previews

<table>
  <tr>
    <td><img width="400" alt="1" src="https://github.com/user-attachments/assets/2342eb64-6afc-4cba-b7b4-4ef87644c829" /></td>
    <td><img width="400" alt="2" src="https://github.com/user-attachments/assets/77863272-fe9b-4a0d-9463-60a9f5e94523" /></td>
  </tr>
  <tr>
    <td><img width="400" alt="3" src="https://github.com/user-attachments/assets/f5e5ea6a-d045-4c43-9ce8-9a57c223602b" /></td>
    <td><img width="400" alt="4" src="https://github.com/user-attachments/assets/f44a8b82-fb4c-43a2-b5f6-bba86b34f110" /></td>
  </tr>
  <tr>
    <td><img width="400" alt="5" src="https://github.com/user-attachments/assets/37ce0c4f-5b6d-4d30-af42-5eb6a9f80823" /></td>
    <td><img width="400" alt="6" src="https://github.com/user-attachments/assets/a85ae20f-ce46-48b3-9d75-197e465115dd" /></td>
  </tr>
</table>

<details>
  <summary><h2>Light theme (flashbang!)</h2></summary>
  <table>
    <tr>
      <td><img width="400" alt="2026-04-17_00-59-13" src="https://github.com/user-attachments/assets/fe7372cf-1623-4558-845f-bd2bf571172a" /></td>
      <td><img width="400" alt="2026-04-03_19-10-48" src="https://github.com/user-attachments/assets/266b55ff-e570-4b63-a1cd-d0bca158d00a" /></td>
    </tr>
    <tr>
      <td><img width="400" alt="2026-04-03_19-14-03" src="https://github.com/user-attachments/assets/e0c4dfbe-e9b2-4cb7-8efd-199e87d7e0d1" /></td>
      <td><img width="400" alt="2026-04-05_15-45-57" src="https://github.com/user-attachments/assets/8add4fd4-f36b-4c91-8738-ecc5886f33e1" /></td>
    </tr>
    <tr>
      <td><img width="400" alt="2026-04-03_19-18-33" src="https://github.com/user-attachments/assets/14287c46-ecb3-4d73-8b00-3190c5603641" /></td>
      <td><img width="400" alt="2026-04-18_15-50-04" src="https://github.com/user-attachments/assets/d8092246-eff8-4a3d-b379-a9e74217e1a8" /></td>
    </tr>
  </table>
</details>

## Structure
```
~/.config/hypr                        # Hyprland configuration
├── configs
│   ├── animations.conf 
│   ├── binds.conf
│   ├── environ.conf                  # Environment variables
│   ├── exec.conf                     # Startup chores 
│   ├── rules.conf                    # Window/layer rules
│   └── settings.conf                 # Misc settings
├── hypridle.conf
├── hyprland.conf                     # Monitor configuration is here
└── hyprlock.conf

~/.config/waybar                      # Waybar configuration files
├── colors                            # Color paletes
│   ├── colors.css -> colors.dark.css # Symlink to current palete
│   ├── colors.dark.css
│   └── colors.light.css
├── context                           # Context menus for some modules
│   ├── ctlcenter.xml
│   └── network.xml
├── layouts                           # Different waybar layouts
│   ├── with_music.jsonc
│   └── with_window.jsonc
├── config.jsonc                      # Main config file
├── modules.jsonc                     # Wabar module configs
└── style.css                         # Main css
```

### Misc
You can find some usefull scripts in `~/.local/bin` they are added to path by default in `~/.config/zsh/.zshrc`. If you have a keyboard with backlight, you can setup auto_walls to automatically set best matching color, see `.config/auto_walls/config.json`  

## Installation

> [!WARNING]  
> My dotfiles are __*laptop specific*__. Despite trying to make a flexible installation script, some of the things might not work! You better install everything manually based on your needs, or use this repository as an inspiration.

The installation script assumes you have a minimal working system! Firstly lets install all the necessary packages. On arch based distros you can copy & paste this command:

```sh
sudo pacman -S hyprland hyprlock hypridle waybar swaync alacritty cava rofi pavucontrol thunar zsh ttf-cascadia-code ttf-cascadia-code-nerd awww python-psutil eza fzf htop jq neovim xdg-desktop-portal-gtk xdg-desktop-portal-hyprland grim slurp nvtop nwg-look mission-center powertop qt6ct kvantum noto-fonts noto-fonts-emoji flameshot wtype papirus-icon-theme
```

And run this with your AUR helper (example with yay):

```sh
yay -S spicetify-cli vscodium-bin zen-browser-bin peaclock bibata-cursor-theme kripton-theme-git
```

### XDG base directories

> [!WARNING]  
> My config files change [XDG base user directories](https://wiki.archlinux.org/title/XDG_Base_Directory#User_directories).
> Instead of having `~/Desktop`, `~/Downloads`, `~/Pictures` I use `~/wsp`, `~/dow`, `~/med/pictures` ...
> This means that some of your previous settings might be screwed up!

You can change these configurations here:
- [user-dirs.dirs](https://github.com/cebem1nt/dotfiles/blob/main/.config/user-dirs.dirs)
- [environ.conf](https://github.com/cebem1nt/dotfiles/blob/main/.config/hypr/configs/environ.conf#L53)
- [.zshrc](https://github.com/cebem1nt/dotfiles/blob/main/.config/zsh/.zshrc#L26)

### Bluegrey folders
For this, install `papirus-folders` cli tool, or download and install icon pack with bluegrey folders [directly](https://www.gnome-look.org/p/1166289)

```sh
yay -S papirus-folders-git
```

```sh
# Apply the color theme
papirus-folders -C bluegrey
```

After successful installation, you can safely uninstall the script

```sh
yay -Rns papirus-folders-git
```

Now clone the repo & run the installer:

```sh
git clone https://github.com/cebem1nt/dotfiles.git --depth=1
cd dotfiles
./install # Do not run as super user!
```

## Uninstallation
Just run `restore` script, it will restore all your previous config files stored at `~/.local/old`. If your files were not restored, take look at `~/.local/` there might be multiple `old` directories if you were running installer more than once

```sh
./restore
```

## Binds

### General
| Bind                  | Description              |
|---------------------- |--------------------------|
| `SUPER + ;`           | Open terminal            |
| `SUPER + n`           | Open browser             |
| `SUPER + m`           | Open vscodium            |
| `SUPER + b`           | Open thunar              |
| `SUPER + q`           | close window             |
| `SUPER SHIFT + q`     | kill window              |
| `SUPER + w`           | center window            |
| `SUPER + f`           | toggle floating window   |
| `SUPER SHIFT + f`     | fullscreen window        |
| `SUPER + u`           | pin window               |
| `SUPER + o`           | toggle windows grouping  |
| `SUPER CTRL  + r`     | Reload hyprland config   |
| `SUPER SHIFT + >`     | Cycle next wallpaper     |
| `SUPER SHIFT + <`     | Cycle prev wallpaper     |
| `SUPER SHIFT + /`     | Toggle wallpapes cycle   |

### Menus
| Bind                  | Description              |
|---------------------- |--------------------------|
| `SUPER + r`           | Drun (app runner)        |
| `SUPER + t`           | Notification center      |
| `SUPER + v`           | Clipboard                |
| `SUPER + y`           | Wallpapers               |
| `SUPER + ESCAPE`      | Logout menu              |
| `SUPER + e`           | Filebrowser menu         |
| `SUPER SHIFT + v`     | Glyphs selector          |
| `SUPER SHIFT + r`     | Shell commands runner    |
| `SUPER SHIFT + e`     | Bookmarks                |

### Navigation
| Bind                  | Description              |
|---------------------- |--------------------------|
| `SUPER + arrow keys`  | move focus in direction  |
| `SUPER + 1...6`       | go to workspace          |
| `SUPER SHIFT + 1...6` | move to workspace        |
| `SUPER CTRL + 1...6`  | move & go to workspace   |
| `SUPER + s`           | toggle special workspace |
| `SUPER SHIFT + s`     | move to special workspace|


> [!NOTE]
> For more detailed info see `.config/hypr/configs/binds.conf`. It's well commented, you can find more fancy keybinds like: next/prev song, hide waybar, record video, increase/decrease volume or change them

## Something doesn't work/missing ? 
Feel free to post an issue or contribute!
