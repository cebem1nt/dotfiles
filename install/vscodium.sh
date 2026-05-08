# If vscodium is installed, lets apply theme
source $(dirname "$0")/__base.sh

_script "Installing vscodium themes..."

if which vscodium >/dev/null 2>&1 ; then
    vscodium --install-extension "Venage5603.tokyo-night-dark-enhanced" # Dark theme
    vscodium --install-extension "enkia.tokyo-night" # Light theme
else
    _error "Vscodium is not installed, theme won't be installed"
    exit 1
fi

_done "Vscodium themes were installed!"