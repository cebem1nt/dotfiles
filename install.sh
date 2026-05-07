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

_info() { 
    printf '\033[32m[INFO]\033[0m %s\n' "$*"
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

export BACKUP_DIR
export SRC
export DEST

mkdir -p "$BACKUP_DIR"
mkdir -p "$DEST"/.config # Just in case
mkdir -p "$DEST"/.local
mkdir -p "$DEST"/.local/share/applications
mkdir -p "$DEST"/.local/share/templates

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