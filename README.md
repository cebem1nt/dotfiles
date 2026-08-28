# My dotfiles
My daily drive archlinux dotfiles including scripts, wallpapers pack and some other tweaks. The "shell" is built using classic `rofi`, `swaync` and `waybar`.

<details open>
  <summary>Info</summary>

- WM: Hyprland
- Fonts: [Cascadia Code](https://github.com/microsoft/cascadia-code) and [Caskaydia Cove](https://github.com/eliheuer/caskaydia-cove) (Nerd font version)
- GTK themes: [Kripton](https://github.com/EliverLara/Kripton) and [Tokyonight](https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme) (For the light theme)
- Icon theme: [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)
- Shell: zsh with [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) 

</details>

## Screenshots


<table>
  <tr>
    <td><img width="1920" height="1080" alt="1" src="https://github.com/user-attachments/assets/6a9b8a5e-e8da-4cf6-aa9a-ce2fa253adfe" /></td>
    <td><img width="1920" height="1080" alt="2" src="https://github.com/user-attachments/assets/1a126ed2-1c1c-4a2a-a7e1-0f086618c9c9" /></td>
  </tr>
  <tr>
    <td><img width="1920" height="1080" alt="3" src="https://github.com/user-attachments/assets/06f7454e-0d82-47ea-a9ad-7355782f97f1" /></td>
    <td><img width="1920" height="1080" alt="4" src="https://github.com/user-attachments/assets/8f47eec0-5c68-448b-aeaa-e3f85ad16118" /></td>
  </tr>
  <tr>
    <td><img width="1920" height="1080" alt="5" src="https://github.com/user-attachments/assets/2592345b-7805-436c-ae58-7a7339580350" /></td>
    <td><img width="1920" height="1080" alt="6" src="https://github.com/user-attachments/assets/eaf3fe44-141c-44bd-b248-f1f20b7c9e75" /></td>
  </tr>
  <tr>
    <td><img width="1920" height="1080" alt="7" src="https://github.com/user-attachments/assets/900b8b36-8b24-4630-93a8-b2595dbeabe3" /></td>
    <td><img width="1920" height="1080" alt="8" src="https://github.com/user-attachments/assets/9f005e48-8d57-4b69-a5ae-3468155896da" /></td>
  </tr>

</table>

## Important notes

### Default terminal emulator

Default terminal emulator is `alacritty` make sure it is installed. Press `SUPER + ;` to run it. For more bindings list see [Binds](#binds)

### Hyprland coniguration

**Hyprland configuration files are located** in [`~/.config/hypr/`](.config/hypr/) and are splitted into sub-configs that are located under `config/`. Each one has a link to the wiki page related to it at the top. 

### XDG Base directories

> [!WARNING]
> I use slightly different XDG directories on my system: 
> 
> - Instead of `~/Downloads` - `~/dow`
> - Instead of `~/Desktop` - `~/wsp`
> - Instead of `~/Pictures` - `~/med/pictures`
> - Instead of `~/Videos` - `~/med/videos`


Please keep that in mind before running the installation. This might screw up some of your things. You can change it, here:

- [`~/.config/user-dirs.dirs`](.config/user-dirs.dirs)
- [`~/.config/hypr/config/env.lua`](.config/hypr/config/env.lua)

## Installation

> [!NOTE]
> ***Please consider using this repo as a guide, example or an inspiration to create your own dotfiles*** 
>
> Author strongly **advises against installing other people's dotfiles blindly.**

> [!IMPORTANT]
> Installer script was tested on Arch linux.
> 
> ***On another distro, some things might not work as expected.***
>
> If you're using another distro, ***please install these packages*** based on your package manager:
>   1) [packages.txt](./packages.txt) (oficial repos on Arch)
>   2) [packages.aur.txt](./packages.aur.txt) (Arch User Repository packages)

---

Before running the installer, install the necessary packages. On archlinux, you can copy & paste this: 

```sh
sudo pacman -S hyprland hyprlock hypridle xdg-desktop-portal-gtk xdg-desktop-portal-hyprland waybar swaync rofi nwg-dock-hyprland awww zsh alacritty thunar spotify-launcher neovim cava pavucontrol eza fzf htop jq wtype nvtop flameshot grim slurp python-psutil qt6ct kvantum powertop nwg-look mission-center papirus-icon-theme noto-fonts noto-fonts-emoji ttf-cascadia-code ttf-cascadia-code-nerd
```

Also, **make sure that you have an AUR helper** like yay installed. With an AUR helper install these:

```sh
yay -S vscodium-bin zen-browser-bin peaclock kripton-theme-git tokyonight-gtk-theme-git spicetify-cli bibata-cursor-theme
```

Altenatively, see [packages.txt](./packages.txt) and [packages.aur.txt](./packages.aur.txt), install manually the packages you think are needed

Clone the repo & run the installer:

```sh
git clone https://github.com/cebem1nt/dotfiles.git --depth=1
cd dotfiles
./install.sh # DO NOT run as super user!
```

Or install components separately by running scripts from `install/` directory:

```sh
./install/waybar.sh      # Waybar configuration
./install/spicetify.sh   # Spotify theme
./install/scripts.sh     # Scripts
./install/config.sh      # "Almost all" configuration files
```

## Uninstallation
**Your previous config files are stored in** `~/.local/old` (or `~/.local/old-N` based on N times executed the install.sh script). You can restore necessary config files manually or using `./restore.sh` script:

```sh
./restore.sh
```

## Binds

<details open>
  <summary><h3>Hyprland</h3></summary>

<table>
  <tr><td>General</td><td>Menus & Navigation</td><td>Misc/Hacky</td></tr>
  <tr>
  <td>

| Bind                  | Description              |
|---------------------- |--------------------------|
| `SUPER + ;`           | Open alacritty           |
| `SUPER SHIFT + ;`     | Open alacritty in floating mode |
| `SUPER + n`           | Open zen                 |
| `SUPER + m`           | Open vscodium            |
| `SUPER + b`           | Open thunar              |
| `SUPER + q`           | Close window             |
| `SUPER SHIFT + q`     | Kill window              |
| `SUPER + f`           | Toggle floating window   |
| `SUPER SHIFT + f`     | Fullscreen window        |
| `SUPER + u`           | Pin window               |
| `SUPER + w`           | Center floating / Cycle scrolling proption |
| `SUPER SHIFT + w`     | Cycle scrolling proption back|
| `SUPER CTRL + r`      | Reload hyprland config   |
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
| `SUPER + e`           | File browser menu        |
| `SUPER SHIFT + v`     | Glyphs selector          |
| `SUPER SHIFT + r`     | Shell commands runner    |
| `SUPER + arrow keys`  | move focus in direction  |
| `SUPER + 1...5`       | go to workspace          |
| `SUPER SHIFT + 1...5` | move to workspace        |
| `SUPER CTRL + 1...5`  | move & go to workspace   |
| `SUPER + s`           | toggle special workspace |
| `SUPER SHIFT + s`     | move to special workspace|
| `SUPER CTRL + s`      | move & go to special workspace|

  </td>
  <td>

| Bind                  | Description              |
|---------------------- |--------------------------|
| `SUPER + tab`         | Cycle workspace layout (dwindle, scrolling, ...) |
| `SUPER SHIFT tab`     | Cycle previous workspace layout |
| `SUPER + .`           | Play next song           |
| `SUPER + ,`           | Play previous song       |
| `SUPER + p`           | Pseudotile window        |
| `SUPER + x`           | Hide window (A.K.A "minimize") |
| `SUPER + o`           | Create a window group    |
| `SUPER + ]`           | Select next window in group |
| `SUPER + [`           | Select previous window in group |
| `SUPER SHIFT + .`     | Cycle next wallpaper     |
| `SUPER SHIFT + ,`     | Cycle prev wallpaper     |
| `SUPER SHIFT + /`     | Toggle wallpapes cycle   |
| `SUPER SHIFT + y`     | Switch between light and dark theme |
| `SUPER + space`       | Hide/show dock           |
| `SUPER SHIFT + space` | Reload waybar            |

  </td>
  </tr>
</table>

> For more detailed info see [`~/.config/hypr/config/binds.lua`](.config/hypr/config/binds.lua).

</details>

<details>
  <summary><h3>Mango</h3></summary>

<table>
  <tr><td>General</td><td>Menus & Navigation</td><td>Misc/Hacky</td></tr>
  <tr>
    <td>

| Bind                  | Description              |
|---------------------- |--------------------------|
| `SUPER + ;`           | Open alacritty           |
| `SUPER SHIFT ;`       | Open alacritty in floating mode |
| `SUPER + n`           | Open zen                 |
| `SUPER + m`           | Open vscodium            |
| `SUPER + b`           | Open thunar              |
| `SUPER + q`           | Close window             |
| `SUPER SHIFT + q`     | Kill window              |
| `SUPER + w`           | Center floating window   |
| `SUPER + f`           | Toggle floating window   |
| `SUPER SHIFT + f`     | Fullscreen window        |
| `SUPER + u`           | Toggle global window     |
| `SUPER + i`           | Toggle window overlay mode|
| `SUPER CTRL  + r`     | Reload mango config      |
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
| `SUPER + e`           | File browser menu        |
| `SUPER SHIFT + v`     | Glyphs selector          |
| `SUPER SHIFT + r`     | Shell commands runner    |
| `SUPER + arrow keys`  | move focus in direction  |
| `SUPER + 1...5`       | go to workspace          |
| `SUPER CTRL + 1...5`  | move to workspace        |
| `SUPER SHIFT + 1...5` | move & go to workspace   |
| `SUPER + x`           | Minimize window          |
| `SUPER SHIFT + x`     | Show minimized window    |
| `SUPER CTRL + x`      | Unminimize window|
  
  </td>
  <td>

| Bind                  | Description              |
|---------------------- |--------------------------|
| `SUPER + Tab`         | Overview / (A.K.A "Alt tab")|
| `SUPER + o `          | Labled overview (pick window)|
| `SUPER + .`           | Play next song           |
| `SUPER + ,`           | Play previous song       |
| `SUPER + g`           | Toggle all windows floating|
| `SUPER + /`           | Play / Pause song        |
| `SUPER + space`       | Hide/show dock           |
| `SUPER SHIFT + space` | Reload waybar            |
| `SUPER SHIFT + y`     | Switch between light and dark theme |
| `SUPER + w`           | Cycle scroller proption  |
| `SUPER SHIFT + w`     | Cycle scroller proption back|
| `SUPER + BACKSPACE`   | Focus previous window    |
| `SUPER SHIFT + >`     | Cycle next wallpaper     |
| `SUPER SHIFT + <`     | Cycle prev wallpaper     |
| `SUPER SHIFT + /`     | Toggle wallpapes cycle   |

  </td>
  </tr>
</table>

> For more detailed info see [`~/.config/mango/binds.conf`](.config/mango/binds.conf).

</details>

## Documentation

Documentation is provided via `README.md` files in different subdirectories.

**Index:**

  - [Sway notification center](.config/swaync/README.md)
  - [Waybar config documentation](.config/waybar/README.md)
  - [Startup scripts](.local/bin/startup/README.md)
  - [Scripts cheatsheet](.local/bin/README.md)
  - [Note on .local/share/applications](.local/share/applications/README.md)
  - [Zen browser theme note](.zen/README.md)
  - [Misc configuration files](etc/README.md)
    - [Display manager/greeter info (ly) ](etc/ly/README.md)
    - [xdg-desktop-portal note](etc/xdg-desktop-portal/README.md)
    - [kernel modules configs](etc/modprobe.d/README.md)

## Scripts

I have a huge collection of scripts for the usage on my system. You can find them in [`~/.local/bin`](.local/bin/). Some of them are used from [hyprland binds config](.config/hypr/config/binds.lua) others are used from [waybar modules config](.config/waybar/modules.jsonc). Some are used from [swaync buttons config](.config/swaync/config.json).

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

## Patched programs

I have a **"software patching"** hobby, that's why there are configs for a bit modified programs in my dotfiles. To be exact:

- `rofi`: [4 addittional drun modes](https://github.com/cebem1nt/rofi/releases/tag/patch), with pre categorized desktop entries
    See [`~/.config/rofi/bin/drun`](.config/rofi/bin/drun)
  
    ```sh
     rofi -theme ~/.config/rofi/themes/launcher.rasi \
          -show drun \
          -modi "drun,drun-utils,drun-games,drun-network,drun-media" \
          -drun-exclude-categories "Game" \
          -display-drun "" \
          -display-drun-games "󰊴" \
          -display-drun-utils "" \
          -display-drun-network "󰭹" \
          -display-drun-media "󰲍" \
    ```
    
    <img width="437" height="56" alt="image" src="https://github.com/user-attachments/assets/d11d9a6e-1feb-42e4-b0d5-0950ba7ccbe8" />
  
- `nwg-dock-hyprland`: [A complete fork](https://github.com/cebem1nt/nwg-dock-hyprland): dock reveal on left click instead of hover, won't reveal if there is an app in fullscreen, Misc right click actions reorganization, hyprland v0.55 support

## Something doesn't work / need help ? 

Feel free to post an issue, open discussion or contribute!
