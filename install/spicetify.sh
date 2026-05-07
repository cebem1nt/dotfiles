# Install spicetify theme. Assumes spotify is installed
source $(dirname "$0")/_install_base.sh

_script "Installing spicetify theme..."

if ! which spicetify >/dev/null 2>&1; then
    _info "Spicetify was not found. Installing..."
    
    if [[ -z $AUR ]]; then
        _info "No AUR helper. Installing from source..."
        echo_and_exec curl -fsSL https://raw.githubusercontent.com/spicetify/cli/main/install.sh | sh
        check_status $?
    else
        $AUR -S spicetify-cli
    fi
fi

if [[ -e "$DEST/.config/spicetify/Themes/Custom" ]]; then
    _info "Previous spicetify theme found, backing up..."

    ensure_backup_dir

    mkdir -p "$BACKUP_DIR"/.config/spicetify/Themes
    mv "$DEST/.config/spicetify/Themes/Custom" "$BACKUP_DIR"/.config/spicetify/Themes
fi

mkdir -p "$DEST/.config/spicetify/Themes"
cp -r "$SRC/.config/spicetify/Themes/Custom" "$DEST/.config/spicetify/Themes"

spicetify backup apply
spicetify config current_theme "Custom"
spicetify apply

_done "Spicetify theme was installed!"
