# Move wallpapers.
source $(dirname "$0")/_install_base.sh

_script "Installing wallpapers ..."
_info "Copying wallpapers to $DEST/med/pictures/wallpapers ..."

mkdir -p "$DEST"/med/pictures/
cp -r "$SRC"/wallpapers "$DEST"/med/pictures/

_done "Wallpapers were installed!"
