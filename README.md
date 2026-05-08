# My dotfiles
My archlinux dotfiles, some scripts and wallpapers 

## Quick info
- Panel: waybar
- Notifications: swaync
- Menus: rofi
- Terminal: alacritty
- Shell: zsh (+ohmyzsh)
- Font: Cascadia Code
- GTK theme: [kripton](https://github.com/EliverLara/Kripton) / [Tokyonight](https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme) (Light theme)
- Icon theme: [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- fetch: [mine :)](https://github.com/cebem1nt/sillyfetch)

Big thanks to this [collection of rofi themes](https://github.com/adi1090x/rofi)

## Previews

<img width="1920" height="1080" alt="preview" src="https://github.com/user-attachments/assets/606e4699-0a4b-4137-85ad-2a5a9c412517" />

## Installation

> [!IMPORTANT]
> Installer script was tested on Arch linux.
> Other distros are still supported, but some things might not work as expected.
>
> If you're on another distro, ***please install these packages*** based on your distro package manager:
>   1) [Packages](https://github.com/cebem1nt/dotfiles/blob/main/packages.txt) (oficial repos on Arch)
>   2) [Packages](https://github.com/cebem1nt/dotfiles/blob/main/packages.aur.txt) (Arch User Repository packages)

Clone the repo & run the installer:

```sh
git clone https://github.com/cebem1nt/dotfiles.git --depth=1
cd dotfiles
./install.sh # DO NOT run as super user!
```

Alternatively, you can install components separately by running scripts from `install/` directory:

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
> For more detailed info see `.config/hypr/configs/binds.conf`. It's well commented, you can find more fancy keybinds like: next/prev song, hide waybar, record video, increase/decrease volume or change them

## Something doesn't work / is missing ? 
Feel free to post an issue or contribute!
