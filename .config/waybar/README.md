# Waybar config

Configuration files for waybar. To use just copy, paste this directory to your `~/.config/waybar`

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
├── layouts                             # Different waybar layouts
│   ├── with_music.jsonc                # Layout with the mpris module at left side
│   └── with_window.jsonc               # Layout with the current window title (hyprland/window)
├── config.jsonc                        # Main config file
├── modules.jsonc                       # Waybar module configs
└── style.css                           # Main css
```

- The main css styles are defined in `style.css`. It imports `./colors/colors.css` with current color scheme definitions.
- The modules configs are defined in `./modules.jsonc`
- The `config.jsonc` includes current layout (see note below)


### What is `./layouts` used for?

I have script to toggle between the two modes, the one that gives control over the current track (mpris module) and the one showing current window title. [You can find the script here](../../.local/bin/change_waybar_layout).

### Context menus? 

Take a look at `./context`, these are GTK builder xml definitions. For more info [check this waybar wiki page](https://github.com/Alexays/Waybar/wiki/Module:-Custom:-Menu) 

### What is `./colors` used for?

**This directory contains light/dark color schemes** `style.css` imports `./colors/colors.css`, which currently is a symlink to `./colors/colors.dark.css`. You can remove symlinks, and use the scheme you like directly. Why there are two color schemes? [I have a script to switch between the light and dark theme](../../.local/bin/themesw)

### Expanding drawers? 

You can take a look at their definitions in [./layouts/with_music.jsonc](https://github.com/cebem1nt/dotfiles/blob/main/.config/waybar/layouts/with_music.jsonc#L41) or [./layouts/with_window.jsonc](https://github.com/cebem1nt/dotfiles/blob/main/.config/waybar/layouts/with_window.jsonc#L40) (they are equal)
