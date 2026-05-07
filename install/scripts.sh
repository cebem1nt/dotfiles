# Installs scripts.
source $(dirname "$0")/_install_base.sh

_script "Installing scripts from $SRC/.local/bin ..."

# Initialize/update submodules (auto_walls)
_info "Initializing submodules..."
git submodule init

if [ -e "$DEST/.local/bin" ]; then
    ensure_backup_dir

    mv "$DEST/.local/bin" "$BACKUP_DIR"/.local/bin
fi

mkdir -p "$DEST/.local/bin"
cp -r "$SRC/.local/bin" "$DEST/.local/"
 
_done "Scripts were installed!"
