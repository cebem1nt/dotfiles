# Waybar config

Configuration files for waybar. To use just copy, paste this directory to your `~/.config/waybar` ***but see [the note below](#usage)***

<img width="1919" height="40" alt="waybar-preview" src="https://github.com/user-attachments/assets/2db3baae-dee3-4f55-bc83-a3bc00d2993a" />

## Structure
```
~/.config/waybar
├── colors                              # Color palettes
│   ├── colors.css -> colors.dark.css   # Symlink to current palette
│   ├── colors.dark.css                 # Dark color scheme
│   └── colors.light.css                # Light color scheme
├── context                             # Context menu definitions for some modules
│   ├── ctlcenter.xml                   # Context menu for the control center
│   └── network.xml                     # For the network module
├── config.jsonc                        # Main config file
├── modules.jsonc                       # Waybar modules configuration
└── style.css                           # Main css
```

> [!NOTE]
> - `config.jsonc` is the main configuration file with position, modules layout, etc 
> - Waybar modules are configured in `modules.jsonc`. `config.jsonc` imports it 
> - CSS styles are defined in `style.css`, it imports `colors/colors.css` with current color scheme definitions. There are two presets: light/dark

## Usage

> [!IMPORTANT]
> ***Unfortunately, if you copy & paste this configuration, it won't work out of the box***

### Applications & tools

In orded to make modules actions work, install these applications and tools:

> [!NOTE]
> **All the GUI/TUI applications are executed using `hyprctl`** that means, **apps won't spawn if you're not on Hyprland**

- `pavucontrol`
- `pactl`
- `nmcli`
- `blueman-manager`
- `peaclock`
- `alacritty`
- `playerctl`
- `swaync`

### Scripts

Some waybar modules from `modules.jsonc` use the following scripts (on click/context menu actions). Please copy them to `~/.local/bin/` (or alternatively, tweak modules configurations based on your needs):

- [`toggle_bluetooth`](../../.local/bin/toggle_bluetooth)
- [`refreshrate`](../../.local/bin/refreshrate)
- [`caffeine`](../../.local/bin/caffeine)
- [`powersafe`](../../.local/bin/powersafe) 


## FAQ

### What is `colors/` used for?

**This directory contains light/dark color schemes** `style.css` imports `colors/colors.css`, which currently is a symlink to `colors/colors.dark.css`. You can remove symlinks, and use the scheme you like directly. 

Why are there two color schemes? [I have a script to switch between the light and dark theme](../../.local/bin/themesw)

### Context menus? 

Take a look at `context/`, there are GTK builder xml files. For more info [check this waybar wiki page](https://github.com/Alexays/Waybar/wiki/Module:-Custom:-Menu)


### Expanding drawers? 

You can take a look at their definitions in [config.jsonc](https://github.com/cebem1nt/dotfiles/blob/main/.config/waybar/config.jsonc#L41)
