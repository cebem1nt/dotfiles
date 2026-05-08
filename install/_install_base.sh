# Not an install script, just a module with shared functions and variables
SRC=${SRC:-"$(realpath $(dirname "$0"))/.."}
DEST=${DEST:-$HOME}

if which yay >/dev/null 2>&1; then
    AUR=yay
elif which paru >/dev/null 2>&1; then
    AUR=paru
fi

_error()   { printf '\033[31m[ERROR]\033[0m %s\n' "$*";  }
_info()    { printf '\033[32m[INFO]\033[0m %s\n' "$*";   }
_script()  { printf '\033[34m[SCRIPT]\033[0m %s\n' "$*"; }
_done()    { printf '\033[34m[DONE]\033[0m %s\n' "$*";   }
_warning() { printf '\033[33m[WARNING]\033[0m %s\n' "$*";}

check_status() {
    local message=${2:-"Something went wrong."}

    if [[ $1 -ne 0 ]]; then
        _error "$message"
        read -r -p "Press ENTER to continue..."
        exit
    fi
}

echo_and_exec() {
    _info "$@"
    "$@"
}

ensure_backup_dir() {
    # If running from main script, BACKUP_DIR will automatically be set
    while [[ ! -d "$BACKUP_DIR" ]]; do
        read -p "Enter backup directory: " BACKUP_DIR
        BACKUP_DIR="${BACKUP_DIR/#\~/$HOME}"
        mkdir -p "$BACKUP_DIR"

        if [[ ! -d "$BACKUP_DIR" ]]; then
            _error "Could not create directory. Try again."
        fi
    done
}

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