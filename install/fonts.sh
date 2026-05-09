source $(dirname "$0")/__base.sh

_script "Installing fonts and fontconfig..."

if which pacman >/dev/null 2>&1; then
    if ! pacman -Q noto-fonts noto-fonts-emoji ttf-cascadia-code ttf-cascadia-code-nerd >/dev/null 2>&1; then
        echo_and_exec sudo pacman -S noto-fonts noto-fonts-emoji ttf-cascadia-code ttf-cascadia-code-nerd --noconfirm
    else
        _info "Fonts are allready installed."
    fi
else
    _error "Not an arch based distro. Please install fonts manually:"
    echo "         - noto-fonts"
    echo "         - noto-fonts-emoji"
    echo "         - ttf-cascadia-code"
    echo "         - ttf-cascadia-code-nerd"
    read -r -p "Press ENTER to continue..."
    exit
fi

# Previous fontconfig exists
if [[ -e "$DEST/.config/fontconfig" ]]; then
    _info "Previous fontconfig found, backing up..."

    ensure_backup_dir

    mkdir -p "$BACKUP_DIR"/.config
    mv "$DEST/.config/fontconfig" "$BACKUP_DIR"/.config
fi

_info "Copying fontconfig..."
mkdir -p "$DEST/.config"
cp -r "$SRC/.config/fontconfig" "$DEST/.config/"

_info "Updating fonts cache..."
echo_and_exec sudo fc-cache -fv