# Waybar config

These are the configuration files for waybar. To use just copy, paste this directory to your `~/.config/waybar`

<img width="1919" height="40" alt="2026-04-13_11-53-05" src="https://github.com/user-attachments/assets/a0a5d813-aa45-4cbd-bb2f-45e00b3cf443" />
<img width="1919" height="40" alt="2026-04-13_11-52-15" src="https://github.com/user-attachments/assets/66545181-cb40-48e4-bd68-78169b3c7549" />
<img width="1919" height="40" alt="2026-04-13_11-51-49" src="https://github.com/user-attachments/assets/c200321e-2100-4ced-945e-2914ae727451" />
<img width="1919" height="40" alt="2026-04-13_11-55-20" src="https://github.com/user-attachments/assets/76bc572d-655d-4470-bb28-1c3950040ad8" />
<img width="1919" height="40" alt="2026-04-13_11-54-40" src="https://github.com/user-attachments/assets/efe5da19-232a-440e-88bb-c1a8029901a9" />
<img width="1919" height="40" alt="2026-04-13_11-54-18" src="https://github.com/user-attachments/assets/2b4cd05c-b59f-4eac-a6b7-797c2ffeb1da" />
<img width="1919" height="40" alt="2026-04-13_11-56-03" src="https://github.com/user-attachments/assets/cf2687cb-9986-4586-bfad-f41cd4189471" />
<img width="1919" height="40" alt="2026-04-13_11-55-43" src="https://github.com/user-attachments/assets/100a67eb-bf05-453b-a1d2-ad9d0e994d10" />
<img width="1919" height="40" alt="2026-04-13_11-56-38" src="https://github.com/user-attachments/assets/360e0e25-ba2a-48cb-9118-3aea08b07e9e" />

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

I have script to toggle between the two modes, the one that gives control over the current track (mpris module) and the one showing current window title. [You can find the script here](https://github.com/cebem1nt/dotfiles/blob/main/.local/bin/change_waybar_layout).

### Context menus? 

Take a look at `./context`, these are GTK builder xml definitions. For more info [check this waybar wiki page](https://github.com/Alexays/Waybar/wiki/Module:-Custom:-Menu) 

### What is `./colors` used for?

This directory contains different gtk css colors definitions the `style.css` uses. `style.css` by default imports `./colors/colors.css`, which currently is a symlink to `./colors/colors.dark.css`. You can remove symlinks, and use the one you like directly. Why there are two color schemes? [I have a script to switch between the light and dark theme](https://github.com/cebem1nt/dotfiles/blob/main/.local/bin/themesw)

### Expanding drawers? 

You can take a look at their definitions in [./layouts/with_music.jsonc](https://github.com/cebem1nt/dotfiles/blob/main/.config/waybar/layouts/with_music.jsonc#L41) or [./layouts/with_window.jsonc](https://github.com/cebem1nt/dotfiles/blob/main/.config/waybar/layouts/with_window.jsonc#L40) (they are equal)
