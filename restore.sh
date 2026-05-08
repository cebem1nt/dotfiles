#!/bin/bash
SRC=${SRC:-"$(realpath $(dirname "$0"))/.."}
DEST=${DEST:-$HOME}

_error()   { printf '\033[31m[ERROR]\033[0m %s\n' "$*";  }
_info()    { printf '\033[32m[INFO]\033[0m %s\n' "$*";   }
_done()    { printf '\033[34m[DONE]\033[0m %s\n' "$*";   }
_warning() { printf '\033[33m[WARNING]\033[0m %s\n' "$*";}

prompt() {
    read -r -p "$1"$'\033[32m [Y/n] \033[0m' CHOICE
    if [ -z "$CHOICE" ]; then 
        echo 1 
    else
        case "$CHOICE" in 
            n|N|No|no ) echo 0;;
            y|Y|* ) echo 1;;
        esac
    fi
}

BACKUP_DIRS=( "$HOME"/.local/old* )

if [ ${#BACKUP_DIRS[@]} -eq 1 ]; then
    if [ "${BACKUP_DIRS[0]}" = "$HOME/.local/old*" ]; then
        _info "No backup directory found at "$HOME"/.local."
    elif [ "${BACKUP_DIRS[0]}" = "$HOME/.local/old" ]; then
        BACKUP_DIR="$HOME/.local/old"
    fi
else
    for DIR_ITR in ${BACKUP_DIRS[@]}; do
        if command -v tree > /dev/null ; then
            tree $DIR_ITR
        else 
            ls $DIR_ITR
        fi
    done

    echo ""
    PS3="Choose backup directory: "
    select CHOSEN in "${BACKUP_DIRS[@]}"; do
        [ -n "$CHOSEN" ] && break
        _error "Invalid choice."
    done

    BACKUP_DIR="${CHOSEN%/}"
fi

 while [[ ! -d "$BACKUP_DIR" ]]; do
    read -p "Enter backup directory: " BACKUP_DIR
    BACKUP_DIR="${BACKUP_DIR/#\~/$HOME}"

    if [[ ! -d "$BACKUP_DIR" ]]; then
        _error "Provided directory does not exist! Try again."
    fi
done

if [ $(prompt "Restore previous config files from $BACKUP_DIR into $DEST?") = 0 ]; then
    exit 1
fi

# Restore .config items that were moved to BACKUP_DIR/.config
if [ -d "$BACKUP_DIR/.config" ]; then
    _info "Restoring .config..."

    for ITEM in "$BACKUP_DIR"/.config/*; do
        NAME=$(basename "$ITEM")
        _info "Restoring $NAME to $DEST/.config/"

        rm -rf "$DEST/.config/$NAME"
        mv "$ITEM" "$DEST/.config/"
    done
else
    _warning "No .config backup found in $BACKUP_DIR"
fi

# Restore zen theme directory if present
if [ -d "$BACKUP_DIR/.zen/chrome" ]; then
    _info "Restoring .zen..."

    if [[ ! -e "$DEST/.zen" ]]; then 
        CONFIG_HOME=${XDG_CONFIG_HOME:-"$HOME/.config"}
        ZEN_PROFILE=$(find "$CONFIG_HOME/zen" -name '*(release)' -type d)
    else
        ZEN_PROFILE=$(find "$DEST/.zen/" -name '*(release)' -type d)
    fi

    if [ -z "$ZEN_PROFILE" ]; then
        _error "Something went wrong..."
        _error "Could not restore zen backup"
    else
        rm "$ZEN_PROFILE/chrome/userContent.css"
        rm "$ZEN_PROFILE/chrome/userChrome.css" 

        mv "$BACKUP_DIR"/.zen/chrome/* "$ZEN_PROFILE/chrome/"
    fi
fi

# Restore .local (bin and share)
if [ -d "$BACKUP_DIR/.local" ]; then
    _info "Restoring .local..."

    # bin
    if [ -d "$BACKUP_DIR/.local/bin" ]; then
        _info "Restoring bin..."

        rm -rf "$DEST/.local/bin"
        mv "$BACKUP_DIR/.local/bin" "$DEST/.local/"
    fi

    # share
    if [ -d "$BACKUP_DIR/.local/share" ]; then
        for ITEM in "$BACKUP_DIR/.local/share/"*; do
            NAME=$(basename "$ITEM")
            _info "Restoring $NAME to $DEST/.local/share/"

            rm -rf "$DEST/.local/share/$NAME"
            mv "$ITEM" "$DEST/.local/share/"
        done
    fi
else
    _warning "No .local backup found in $BACKUP_DIR"
fi

if [ $(prompt "Uninstall zsh & oh-my-zsh?") = 1 ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/uninstall.sh)"

    if [ -e "$BACKUP_DIR/.zshenv" ]; then
        _info "Restoring .zshenv..."
        mv "$BACKUP_DIR/.zshenv" "$DEST/"
    else
        rm "$DEST/.zshenv"
    fi

    if [[ -e "$BACKUP_DIR/.config/zsh" ]] || [[ -e "$BACKUP_DIR/.zshrc" ]]; then
        _info "Restoring zsh configs..."

        mv 2>/dev/null "$BACKUP_DIR/.config/zsh" "$DEST/.config/"
        mv 2>/dev/null "$BACKUP_DIR/.zshrc" "$DEST/"
    fi
fi

if [ -n "$(which spicetify 2>/dev/null)" ] && [ $(prompt "Restore spotify theme?") = 1 ]; then
    spicetify restore
fi

if [ -n "$(which vscodium 2>/dev/null)" ] && [ $(prompt "Remove vscodium theme?") = 1 ]; then
    vscodium --uninstall-extension Venage5603.tokyo-night-dark-enhanced
    vscodium --uninstall-extension "enkia.tokyo-night" # Light theme
fi

if [ -d "$DEST"/med/pictures/wallpapers ] && [ $(prompt "Remove wallpapers? ($DEST/med/pictures/wallpapers)") = 1 ]; then
    rm -rf "$DEST"/med/pictures/wallpapers
fi

rmdir "$BACKUP_DIR/.config"
rmdir "$BACKUP_DIR/.local/share"
rmdir "$BACKUP_DIR/.local/"

rmdir "$BACKUP_DIR/.zen/chrome"
rmdir "$BACKUP_DIR/.zen/"

# Cleanup: if BACKUP_DIR is empty, remove it
if [ -d "$BACKUP_DIR" ] && [ -z "$(ls -A "$BACKUP_DIR")" ]; then
    rmdir "$BACKUP_DIR"
    _info "Removed empty $BACKUP_DIR"
else
    _warning "Some items remain in $BACKUP_DIR; check and remove manually if desired."
fi

_done "Restore complete! See you next time!"