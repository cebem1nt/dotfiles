# Rofi applets / themes

Configuration files, scripts, themes for rofi.

## Structure

```
~/.config/rofi
├── config.rasi     # Main rofi configuration (history, bindings, behavior)
├── bin             # Rofi scripts
│   ├── clipboard   # Clipboard menu 
│   ├── drun        # Applications launcher
│   ├── filebrowser # Tiny dmenu like filebrowser at the top
│   ├── icons.txt    
│   ├── icons       # Nerd font icons picker
│   ├── logout      # Logout menu
│   ├── run         # Raw commands runner
│   └── wifi        # wifi picker (requires rofi-wifi)
└── themes
    ├── bookmarks.rasi              # Bookmarks picker theme (not used actively)
    ├── clipboard.rasi              # Clipboard theme 
    ├── filebrowser.rasi            # Filebrowser theme
    ├── launcher.rasi               # Launcher theme
    ├── launcher-alternative.rasi   # Alternative them for launcher (used from dock)
    ├── logout.rasi                 # Logout launcher themes
    ├── wallpapers.rasi             # Wallpapers picker theme
    ├── wifi.rasi                   # Wifi chooser theme
    ├── wlr-picker.rasi             # Theme for share source selection (in discord, etc)
    └── colors                      # Light / Dark color schemes 
        ├── colors.dark.rasi
        ├── colors.light.rasi
        └── colors.rasi -> colors.light.rasi
```

## Usage

Copy & Paste this directory to your `~/.config`. All the menus scripts are located under `./bin/` directory. Examples:

```sh
~/.config/rofi/bin/drun # Application launcher 
```

```sh
~/.config/rofi/bin/logout # logout menu 
```

## Clipboard

Uses `wl-clip-persist` as clipboard storage, `cliphist` to get from history

### Bindings

- `SHIFT+enter`: Select & type in selected

## Run mode

By default `run` mode is configured to execute commands from zsh, you can modify it in [`~/.config/rofi/config.rasi#L31`](https://github.com/cebem1nt/dotfiles/blob/main/.config/rofi/config.rasi#L31).

### Bindings 

- `SHIFT+enter`: Execute command in a terminal
- `CTRL+enter` : Execute given input, not selected one from history

### Bindings

## Categories for drun entries

To use them, install patched rofi version. You can get PKGBUILD [here](https://github.com/cebem1nt/rofi/releases/download/patch/PKGBUILD)*

*[how to install PKGBUILDs?](https://wiki.archlinux.org/title/Makepkg#Usage)

After installing, uncomment this section in `~/.config/rofi/bin/drun` and remove previous one

```diff
+ rofi -theme $THEME \
+      -show drun \
+      -modi "drun,drun-utils,drun-games,drun-network,drun-media" \
+      -theme-str 'entry { placeholder: "Search..."; }' \
+      -drun-exclude-categories "Game" \
+      -display-drun "" \
+      -display-drun-games "󰊴" \
+      -display-drun-utils "" \
+      -display-drun-network "󰭹" \
+      -display-drun-media "󰲍" \

# Remove this section
- rofi -theme $THEME \
-     -show drun \
-     -theme-str 'entry { placeholder: "Search..."; }' \
-     -modi "drun,run,filebrowser" \
-     -display-drun "" \
-     -display-run "" \
-     -display-filebrowser "󰉋" \
```

[Thx to this repo!](https://github.com/adi1090x/rofi)