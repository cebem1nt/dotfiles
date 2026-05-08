#!/bin/bash
set -e

BACKUP_DIR="$HOME/.local/old"
if [ -e "$BACKUP_DIR" ] && [ "$(ls -A "$BACKUP_DIR")" ]; then
    i=1
    while :; do
        CANDIDATE="${BACKUP_DIR}-${i}"
        if [ ! -e "$CANDIDATE" ] && [ "$(ls -A "$BACKUP_DIR")" ]; then
            BACKUP_DIR="$CANDIDATE"
            break
        fi
        i=$((i+1))
    done
fi

SRC=$(dirname "$0")
DEST=${DEST:-$HOME}
LOG_FILE="install.log"

_error()   { printf '\033[31m[ERROR]\033[0m %s\n' "$*";  }


_info() { 
    printf '\033[32m[INFO]\033[0m %s\n' "$*"
}

_warning() { 
    printf '\033[33m[WARNING]\033[0m %s\n' "$*"
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

check_packges() {
    while IFS= read -r LINE; do
        if [[ -z "$LINE" ]] || [[ ${LINE# } == \#* ]]; then 
            continue
        fi

        PKG="${LINE//[[:space:]]/}"

        if ! pacman -Q "$PKG" >/dev/null 2>&1 ; then
            echo -n "$PKG "
        fi
    done < $1
}

verify_packages() {
    _info "Verifying necessary packages...."

    if which pacman >/dev/null 2>&1; then
        MISSING=$(check_packges "$SRC/packages.txt") 
        MISSING_AUR=$(check_packges "$SRC/packages.aur.txt") 

        if [[ -n "$MISSING" ]]; then
            _warning "The following packages are not insalled:"
            echo "    $MISSING"
            _warning "If you know what you're doing, skip"

            if [[ $(prompt "Install missing packages?") == 1 ]]; then
                sudo pacman -Syu $MISSING
            fi
        fi

        if [[ -n "$MISSING_AUR" ]]; then
            _warning "The following AUR packages are not insalled:"
            echo "    $MISSING_AUR"
            _warning "If you know what you're doing, skip"

            if [[ $(prompt "Install missing packages?") == 1 ]]; then
                if which yay >/dev/null 2>&1; then
                    yay -S $MISSING_AUR
                elif which paru >/dev/null 2>&1; then
                    paru -S $MISSING_AUR
                else
                    _error "No AUR helper found, could not install."
                    read -r -p "Press ENTER to continue..."
                fi
            fi
        fi
    else
        _warning "You're not using an arch/arch based distro."
        _warning "Installer might not work as expected"
        _info "Please make sure to install these packages acording to your distribution: "
        
        cat "$SRC/packages.txt" "$SRC/packages.aur.txt"

        read -r -p "Press ENTER to continue..."
    fi
}

echo "===== Beginning of the installation =====" >> $LOG_FILE
cat /etc/os-release >> $LOG_FILE

cat <<'EOF'
               ,
   |         ,   ^
   |     |   .  _|_        |
   .     ,   .-' . '-. ,   |  |
            /         \    |  .
         .  ^^^^^|^^^^^    ,
    |        .-. |  .-.         .
    | ,     / ^ \| / ^ \  .*    ,
    .      (|   |J/|   |)    .
   ^       '\   /`"\   /`
 -/ \' -'-'  ^`^    ^`^  -- '' -'-',___,....
EOF
echo -ne "\e[34m"
cat <<'EOF'
   ___       _                __     __    
  / _ \___ _(_)__  __ __  ___/ /__  / /____
 / , _/ _ `/ / _ \/ // / / _  / _ \/ __(_-<
/_/|_|\_,_/_/_//_/\_, /  \_,_/\___/\__/___/
                 /___/  
EOF
echo -e "\e[0m"

SCRIPTS=()

if [ $(prompt "Would you like a complete installation?") = 1 ]; then
    SCRIPTS+=(
        "config.sh" "gtk.sh" "icons.sh" "scripts.sh" "spicetify.sh" "vscodium.sh" "wallpapers.sh" "waybar.sh" "zen.sh" "zsh.sh"
        "rofi.sh" "swaync.sh"
    )
else
    declare -A SCRIPT_PROMPTS

    SCRIPT_PROMPTS=(
        ["config.sh"]="Install allmost all the configuration files from .config and .local?" 
        ["gtk.sh"]="Install GTK themes?"
        ["icons.sh"]="Install icon and cursor themes?"
        ["scripts.sh"]="Install all the scripts? (necessary for proper basic functionality)"
        ["spicetify.sh"]="Install spotify theme?"
        ["vscodium.sh"]="Install vscodium themes?"
        ["wallpapers.sh"]="Install wallpapers pack?"
        ["waybar.sh"]="Install waybar configurations?"
        ["zen.sh"]="Install small zen theme?"
        ["zsh.sh"]="Install zsh configs, oh-my-zsh? with modified lukerandall theme?"
        ["rofi.sh"]="Install rofi themes/applets?"
        ["swaync.sh"]="Install swaync configuration files?"
    )

    for SCRIPT in $SRC/install/*; do
        NAME=$(basename $SCRIPT)
        
        [[ $NAME == _* ]] && continue

        if [ $(prompt "${SCRIPT_PROMPTS[$NAME]}") = 1 ]; then
            SCRIPTS+=($NAME)
        fi
    done
fi

verify_packages | tee -a $LOG_FILE

export BACKUP_DIR
export SRC
export DEST

mkdir -p "$BACKUP_DIR"
mkdir -p "$DEST"/.config # Just in case
mkdir -p "$DEST"/.local

for SCRIPT in "${SCRIPTS[@]}"; do
    clear -x
    _info "Running script - $SCRIPT"
    "$SRC"/install/"$SCRIPT" 2>&1 | tee -a $LOG_FILE
done

echo "===== End of the installation =====" >> $LOG_FILE

clear -x
echo -ne "\e[34m"
cat <<'EOF'

   ___   ____     __              __
  / _ | / / / ___/ /__  ___  ___ / /
 / __ |/ / / / _  / _ \/ _ \/ -_)_/ 
/_/ |_/_/_/  \_,_/\___/_//_/\__(_)  

EOF
echo -e "\e[0m"

echo "Experienced some errors/problems with the installer?"
echo "Feel free to post an issue: https://github.com/cebem1nt/dotfiles/issues"
echo "Please, provide the log file ($LOG_FILE)"
echo ""
echo "You can find your previous configuration files here: ($BACKUP_DIR)"
echo ""