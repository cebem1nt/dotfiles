# Install waybar config files
source $(dirname "$0")/__base.sh

_script "Installing waybar config files..."

# Previous waybar config file exists
if [[ -e "$DEST/.config/waybar" ]]; then
    _info "Previous waybar config found, backing up..."

    ensure_backup_dir

    mkdir -p "$BACKUP_DIR"/.config
    mv "$DEST/.config/waybar" "$BACKUP_DIR"/.config
fi

mkdir -p "$DEST/.config/waybar"
cp -r "$SRC/.config/waybar" "$DEST/.config/"

# If there is powerprofilesctl installed, replace waybar start module with power-profiles module
if which powerprofilesctl >/dev/null 2>&1; then
    _info "Replacing 'custom/start' module with power-profiles-daemon ..."
    
    WAYBAR_FILES=(
        "$DEST/.config/waybar/layouts/with_music.jsonc"
        "$DEST/.config/waybar/layouts/with_window.jsonc"
    )
    
    for FILE in "${WAYBAR_FILES[@]}"; do
        sed -i 's|custom/start|power-profiles-daemon|g' "$FILE"
    done
else
    _warning "powerprofilesctl is not installed, 'custom/start' module will be used instead"
fi

_info "Changing clock timezone..."

# Change timezone in waybar clock module
TIMEZONE=$(readlink -f /etc/localtime | sed 's|.*/zoneinfo/||')

sed -i "s/\"timezone\": *\"[^\"]*\"/\"timezone\": \"${TIMEZONE//\//\\/}\"/" \
    "$DEST/.config/waybar/modules.jsonc"

_done "Waybar config was successfully installed!"
