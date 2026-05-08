# Install waybar config files
source $(dirname "$0")/__base.sh

_script "Installing swaync configuration files..."

if [[ -e "$DEST/.config/swaync" ]]; then
    _info "Previous swaync config found, backing up..."

    ensure_backup_dir

    mkdir -p "$BACKUP_DIR"/.config
    mv "$DEST/.config/swaync" "$BACKUP_DIR"/.config
fi

mkdir -p "$DEST/.config"
cp -r "$SRC/.config/swaync" "$DEST/.config/"

_done "Swaync config was successfully installed!"
