# My dotfiles
My daily drive archlinux dotfiles including scripts, wallpapers pack and some other tweaks. The "shell" is built using classic `rofi`, `swaync` and `waybar`.

<details open>
  <summary>Info</summary>

- WM: Hyprland
- Fonts: [Cascadia Code](https://github.com/microsoft/cascadia-code) and [Caskaydia Cove](https://github.com/eliheuer/caskaydia-cove) (Nerd font version)
- GTK themes: [Kripton](https://github.com/EliverLara/Kripton) and [Tokyonight](https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme) (For the light theme)
- Icon theme: [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- Shell: zsh with [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) 

"Shell" Components:

- `Rofi`: Runner, tiny top file browser, wallpapers selector, logout menu, clipboard
- `Waybar`: Top panel
- `Swaync`: Notification daemon and menu
- `nwg-dock-hyprland`: The dock at the left

Misc applications used:

- Alacritty: Terminal emultator
- Zen: Web browser
- Thunar: File browser 
- Vscodium: text editor 
- Neovim: another text editor

</details>

## Screenshots

<img alt="preview" src="https://github.com/user-attachments/assets/422b1acf-e19b-4404-8f9e-f891aa72128c" />

## Important notes

### Default terminal emulator

Default terminal emulator is `alacritty` make sure it is installed. To spawn it use `SUPER + ;`. For more bindings list see [Binds](#binds)

### Hyprland coniguration

Hyprland configuration files are located in [`~/.config/hypr/`](.config/hypr/) and are splitted into sub-configs that are located under `configs/`. Each one has a link to the wiki page related to it at the top. 

### XDG Base directories

> [!WARNING]
> I use slightly different XDG directories on my system: 
> 
> - Instead of `~/Downloads` - `~/dow`
> - Instead of `~/Desktop` - `~/wsp`
> - Instead of `~/Pictures` - `~/med/pictures`
> - Instead of `~/Videos` - `~/med/videos`


Please keep that in mind before running the installation. This might screw up some of your things. Anyways, you always can change it, here:

- `~/.config/user-dirs.dirs`
- `~/.config/hypr/configs/environ.conf`
- `~/.config/zsh/.zshrc`

## Installation

> [!IMPORTANT]
> Installer script was tested on Arch linux.
> 
> ***On another distro, some things might not work as expected.***
>
> If you're on another distro, ***please install these packages*** based on your package manager:
>   1) [Packages](./packages.txt) (oficial repos on Arch)
>   2) [Packages](./packages.aur.txt) (Arch User Repository packages)

---

Before running the installer, install the necessary packages. On archlinux, you can copy & paste this: 

```sh
sudo pacman -S hyprland hyprlock hypridle xdg-desktop-portal-gtk xdg-desktop-portal-hyprland waybar swaync rofi nwg-dock-hyprland awww zsh alacritty thunar spotify-launcher neovim cava pavucontrol eza fzf htop jq wtype nvtop flameshot grim slurp python-psutil qt6ct kvantum powertop nwg-look mission-center papirus-icon-theme noto-fonts noto-fonts-emoji ttf-cascadia-code ttf-cascadia-code-nerd
```

Also, **make sure that you have an AUR helper** like yay installed. With an AUR helper install these:

```sh
yay -S vscodium-bin zen-browser-bin peaclock kripton-theme-git tokyonight-gtk-theme-git spicetify-cli bibata-cursor-theme
```

Altenatively, you can inspect [packages.txt](./packages.txt) and [packages.aur.txt](./packages.aur.txt), And install manually the packages you think are needed

Now clone the repo & run the installer:

```sh
git clone https://github.com/cebem1nt/dotfiles.git --depth=1
cd dotfiles
./install.sh # DO NOT run as super user!
```

Or you can install components separately by running scripts from `install/` directory:

```sh
./install/waybar.sh      # Waybar configuration
./install/spicetify.sh   # Spotify theme
./install/scripts.sh     # Scripts
./install/config.sh      # "Almost all" configuration files
```

## Uninstallation
**Your previous config files are stored in** `~/.local/old` (or `~/.local/old-N` based on N times executed the install.sh script). Or in another backup directory you entered. You can restore necessary config files manually or using `./restore.sh` script:

```sh
./restore.sh
```

## Binds
<table>
  <tr><td>General</td><td>Menus & Navigation</td><td>Misc/Hacky</td></tr>
  <tr>
  <td>

| Bind                  | Description              |
|---------------------- |--------------------------|
| `SUPER + ;`           | Open alacritty           |
| `SUPER + SHIFT ;`     | Open alacritty in floating mode |
| `SUPER + n`           | Open zen                 |
| `SUPER + m`           | Open vscodium            |
| `SUPER + b`           | Open thunar              |
| `SUPER + q`           | Close window             |
| `SUPER SHIFT + q`     | Kill window              |
| `SUPER + w`           | Center window            |
| `SUPER + f`           | Toggle floating window   |
| `SUPER SHIFT + f`     | Fullscreen window        |
| `SUPER + u`           | Pin window               |
| `SUPER + o`           | Toggle windows grouping  |
| `SUPER CTRL  + r`     | Reload hyprland config   |
| `SUPER + z`           | Make active window a bit smaller |
| `SUPER + c`           | Make active window a bit bigger |
    
  </td>
  <td>
    
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
| `SUPER + arrow keys`  | move focus in direction  |
| `SUPER + 1...6`       | go to workspace          |
| `SUPER SHIFT + 1...6` | move to workspace        |
| `SUPER CTRL + 1...6`  | move & go to workspace   |
| `SUPER + s`           | toggle special workspace |
| `SUPER SHIFT + s`     | move to special workspace|
  
  </td>
  <td>

| Bind                  | Description              |
|---------------------- |--------------------------|
| `SUPER + tab`         | Cycle workspace layout (dwindle, scrolling, ...) |
| `SUPER + SHIFT tab`   | Cycle previous workspace layout |
| `SUPER + >`           | Play next song           |
| `SUPER + >`           | Play previous song       |
| `SUPER + p`           | Pseudotile window        |
| `SUPER + x`           | Hide window (A.K.A "minimize") |
| `SUPER + o`           | Create a window group    |
| `SUPER + ]`           | Select next window in group |
| `SUPER + [`           | Select previous window in group |
| `SUPER SHIFT + >`     | Cycle next wallpaper     |
| `SUPER SHIFT + <`     | Cycle prev wallpaper     |
| `SUPER SHIFT + /`     | Toggle wallpapes cycle   |
| `SUPER SHIFT + y`     | Switch between light and dark theme |
| `SUPER + space`       | Hide/show dock           |
| `SUPER SHIFT + space` | Reload waybar            |

  </td>
  </tr>
</table>

> [!NOTE]
> For more detailed info see [`~/.config/hypr/configs/binds.conf`](.config/hypr/configs/binds.conf). It's well commented, you can find more fancy keybinds like: next/prev song, hide waybar, record video, increase/decrease volume or change them

## Scripts

I have a huge collection of scripts for the usage on my system. You can find them in [`~/.local/bin`](.local/bin/). Some of them are used from [hyprland binds config](.config/hypr/configs/binds.conf) others are used from [waybar modules config](.config/waybar/modules.jsonc). Some are used from [swaync buttons config](.config/swaync/config.json).

You can see full scripts cheatsheet [here](.local/bin/README.md)

### Wallpapers menu / daemon

The main script responsible for anything wallpapers related is [auto_walls](https://github.com/cebem1nt/auto_walls). It can:

- Pipe wallpapers menu to rofi
- Set keyboard backlight color based on dominant wallpaper color
- Set next/previous wallpapers
- Set next wallpaper once in N minutes

For more info / setup guide see [README](https://github.com/cebem1nt/auto_walls#auto-walls)

### Light/Dark theme

[`themesw`](.local/bin/themesw) is responsible for the theme switching. It stores name of the next theme in [`~/.config/themesw/next`](.config/themesw/next) and basically just runns sub-scripts that switch theme for each individual application. Sub scripts are located at [`~/.config/themesw/units`](.config/themesw/units/)



## Something doesn't work / is missing ? 

Feel free to post an issue or contribute!
