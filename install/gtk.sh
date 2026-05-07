source $(dirname "$0")/_install_base.sh

_script "Installing GTK themes..."

# Arch based distro, install gtk themes from aur.
# I could not find a remote source of these pre-built themes.
if [[ -z $AUR ]]; then
    _error "No AUR helper found. Please install GTK themes manually:"
    echo "         - kripton: https://github.com/EliverLara/Kripton"
    echo "         - tokyonight (for light theme): https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme"
    read -r -p "Press ENTER to continue..."
    exit
fi

$AUR -S kripton-theme-git tokyonight-gtk-theme-git
check_status $?

_done "GTK themes were installed!"
