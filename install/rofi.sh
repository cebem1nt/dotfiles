# Install waybar config files
source $(dirname "$0")/__base.sh

_script "Installing rofi configuration files..."

if [[ -e "$DEST/.config/rofi" ]]; then
    _info "Previous rofi config found, backing up..."

    ensure_backup_dir

    mkdir -p "$BACKUP_DIR"/.config
    mv "$DEST/.config/rofi" "$BACKUP_DIR"/.config
fi

mkdir -p "$DEST/.config"
cp -r "$SRC/.config/rofi" "$DEST/.config/"

if rofi -h | grep -qE 'drun-(games|utils|network|media|text)'; then
    _info "Patched rofi detected, adding special modes buttons"

    cat > "$DEST/rofi/bin/drun" <<'EOF'
rofi -theme ~/.config/rofi/themes/launcher.rasi \
     -show drun \
     -modi "drun,drun-utils,drun-games,drun-network,drun-media" \
     -drun-exclude-categories "Game" \
     -display-drun "" \
     -display-drun-games "󰊴" \
     -display-drun-utils "" \
     -display-drun-network "󰭹" \
     -display-drun-media "󰲍" \
EOF

fi

_done "Rofi config was successfully installed!"
