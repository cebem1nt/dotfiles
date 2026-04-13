# Waybar config

These are the configuration files for waybar.

## Structure
```
~/.config/waybar                        # Waybar configuration files
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

I have script to toggle between the two modes, the one that gives control over the current track (mpris module) and the one showing current window title. [You can find the script here](https://github.com/cebem1nt/dotfiles/blob/main/.local/bin/change_waybar_layout).

### Context menus? 

Take a look at `./context`, these are GTK builder xml definitions. For more info [check this waybar wiki page](https://github.com/Alexays/Waybar/wiki/Module:-Custom:-Menu) 

### What is `./colors` used for?

This directory contains different gtk css colors definitions the `style.css` uses. `style.css` by default imports `./colors/colors.css`, which currently is a symlink to `./colors/colors.dark.css`. You can remove symlinks, and use the one you like directly. Why there are two color schemes? [I have a script to switch between the light and dark theme](https://github.com/cebem1nt/dotfiles/blob/main/.local/bin/themesw)

### Expanding drawers? 

You can take a look at their definitions in [./layouts/with_music.jsonc](https://github.com/cebem1nt/dotfiles/blob/main/.config/waybar/layouts/with_music.jsonc#L41) or [./layouts/with_window.jsonc](https://github.com/cebem1nt/dotfiles/blob/main/.config/waybar/layouts/with_window.jsonc#L40) (they are equal)