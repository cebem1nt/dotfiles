# Installs "almost everything" from .config and .local
source $(dirname "$0")/_install_base.sh

_script "Installing config files"
_info "Installing everything from $SRC/.config ..."

ensure_backup_dir

for CONFIG_PATH in $SRC/.config/*; do
    NAME=$(basename $CONFIG_PATH)

    # These are excluded, because of separate scripts
    if [ $NAME = "waybar" ] || [ $NAME = "spicetify" ] || [ $NAME = "zsh" ] || [ $NAME = "rofi" ] || [ $NAME = "swaync" ]; then
        continue
    fi
    
    _info "Installing: $CONFIG_PATH"

    if [ -e "$DEST/.config/$NAME" ]; then
        _info "$DEST/.config/$NAME found, backing up..."

        mkdir -p "$BACKUP_DIR"/.config
        mv "$DEST/.config/$NAME" "$BACKUP_DIR"/.config
    fi

    cp -r "$CONFIG_PATH" "$DEST/.config/"
done

# Instead of replacing, just add content of these 
_info "Installing applications, templates from $SRC/.local ..."

if [[ -d "$DEST/.local/share/applications" ]]; then 
    _info "Previous applications found, backing up..."
    mkdir -p "$BACKUP_DIR/.local/share/"
    mv "$DEST"/.local/share/applications "$BACKUP_DIR/.local/share/"
fi

if [[ -d "$DEST/.local/share/templates" ]]; then 
    _info "Previous templates found, backing up..."
    mkdir -p "$BACKUP_DIR/.local/share/"
    mv "$DEST"/.local/share/templates "$BACKUP_DIR/.local/share/"
fi

mkdir -p "$DEST"/.local/share
cp "$SRC"/.local/share/applications/* "$DEST"/.local/share/applications
cp "$SRC"/.local/share/templates/* "$DEST"/.local/share/templates

for LOCAL_SHARE_PATH in "$SRC"/.local/share/*; do
    NAME=$(basename $LOCAL_SHARE_PATH)

    if [ "$NAME" = "applications" ] || [ "$NAME" = "templates" ]; then
        continue
    fi

    _info "Installing $NAME ..."
    
    if [ -e "$DEST/.local/share/$NAME" ]; then
        mkdir -p "$BACKUP_DIR"/.local/share
        mv "$DEST/.local/share/$NAME" "$BACKUP_DIR"/.local/share
    fi

    cp -r $LOCAL_SHARE_PATH $DEST/.local/share/
done

_done "Config and setting files were installed!"