# Installs papirus-icon theme and bibata-cursors
source $(dirname "$0")/_install_base.sh

_script "Installing icon themes..."

if which pacman >/dev/null 2>&1; then
    # Arch based distro, install icon themes with pacman
    if ! pacman -Q papirus-icon-theme >/dev/null 2>&1; then
        echo_and_exec sudo pacman -S papirus-icon-theme --noconfirm
        check_status $?
    else
        _info "papirus-icon-theme is allready installed." 
    fi
else
    # Manual papirus icons installation
    wget -qO- https://git.io/papirus-icon-theme-install | sh
    check_status $?
fi

# Manual papirus-folders installation 
_info "Installing papirus-folders ..."
wget -qO- https://git.io/papirus-folders-install | sh

_info "Setting bluegrey folders color ..."
papirus-folders -C bluegrey
check_status $?

# Uninstall after changing colors
wget -qO- https://git.io/papirus-folders-install | env uninstall=true sh

if [[ -n $AUR ]]; then
    if ! pacman -Q bibata-cursor-theme-bin >/dev/null 2>&1; then
        _info "Installing cursor theme from aur..."
        echo_and_exec $AUR -S bibata-cursor-theme-bin
        check_status $?
    else
        _info "Cursor is allready installed..."
    fi
else
    # Manual bibata cursor installation
    if ls -d /usr/share/icons/Bibata-* 2>/dev/null; then
        _info "Cursor theme is allready installed."
        _done "All icons were installed"
        exit
    fi

    _info "Installing bibata-cursor manually..."
    wget https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata.tar.xz

    tar -xvf Bibata.tar.xz

    _info "sudo mv Bibata-* /usr/share/icons/"
    sudo mv Bibata-* /usr/share/icons/ >/dev/null 2>&1

    rm Bibata.tar.xz
fi

_done "All icons were installed"