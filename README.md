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

## Installationnd:

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

Alternatively, you can install some components separately from `install/` directory:

```sh
./install/waybar.sh # install waybar configuration
./install/spicetify.sh # install spotify theme
./install/scripts.sh # Install scripts
./install/config.sh # Install "almost all" configuration files
```

## Uninstallation
Work in progress.

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
