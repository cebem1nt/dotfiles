# Zen theme
source $(dirname "$0")/_install_base.sh

_script "Installing zen browser custom css..."

if [[ ! -e "$DEST/.zen" ]]; then 
    CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}
    ZEN_PROFILE=$(find "$CONFIG_HOME/zen" -name '*(release)' -type d)
else
    ZEN_PROFILE=$(find "$DEST/.zen/" -name '*(release)' -type d)
fi

if [[ -z "$ZEN_PROFILE" ]]; then
    _error "Could not find $DEST/.zen, perhaps zen-browser is not installed?"
    _error "You should install the theme manually later."

    echo ""
    _info "Additional information:"
    cat "$SRC/.zen/README.md"
    echo ""
else 
    if [[ -f "$ZEN_PROFILE/chrome/userContent.css" ]] || [[ -f "$ZEN_PROFILE/chrome/userChrome.css" ]]; then
        _info "Previous css found, backing up..."
        
        ensure_backup_dir

        mkdir -p "$BACKUP_DIR/.zen/chrome"

        mv 2>/dev/null "$ZEN_PROFILE/chrome/userContent.css" "$BACKUP_DIR/.zen/chrome"
        mv 2>/dev/null "$ZEN_PROFILE/chrome/userChrome.css" "$BACKUP_DIR/.zen/chrome"
    fi

    _info "Moving custom css..."
    mkdir -p "$ZEN_PROFILE/chrome"
    cp -r "$SRC"/.zen/chrome/* "$ZEN_PROFILE/chrome"

    # Enable custom css
    _info "Enabling custom css..."
    echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >> "$ZEN_PROFILE"/user.js
fi

_done "Zen custom css was installed!"