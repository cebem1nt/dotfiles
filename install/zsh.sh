source $(dirname "$0")/_install_base.sh

_script "Installing zsh related configs..."

if [[ -e "$DEST/.config/zsh" ]] || [[ -e "$DEST/.zshrc" ]]; then
    _info "Previous zsh config found, backing up..."

    ensure_backup_dir

    mkdir -p "$BACKUP_DIR"/.config
    
    mv 2>/dev/null "$DEST/.config/zsh" "$BACKUP_DIR/.config/"
    mv 2>/dev/null "$DEST/.zshrc" "$BACKUP_DIR/"
fi

mkdir -p "$DEST/.config"
cp -r "$SRC/.config/zsh" "$DEST/.config/"

export ZSH="$DEST/.config/oh-my-zsh"
export RUNZSH=no

_info "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
check_status $?

_info "Modifying lukerandall theme ..."

# My small modifications to lukerandall theme
cat << 'EOF' > "$ZSH/themes/lukerandall.zsh-theme"
# ZSH Theme - Preview: https://cl.ly/f701d00760f8059e06dc
# Thanks to gallifrey, upon whose theme this is based

local return_code="%(?..%{$fg_bold[red]%}%? ↵%{$reset_color%})"

function my_git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  GIT_STATUS=$(git_prompt_status)
  [[ -n $GIT_STATUS ]] && GIT_STATUS=" $GIT_STATUS"
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$GIT_STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

PROMPT='%{$fg[white]%}%n@%m%{$reset_color%} %{$fg[blue]%}%2~%{$reset_color%} $(my_git_prompt_info)%{$reset_color%}%B»%b '
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=") %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%%"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED="~"
ZSH_THEME_GIT_PROMPT_DELETED="!"
ZSH_THEME_GIT_PROMPT_UNMERGED="?"
EOF

_info "Adding .zshenv ..."
cp "$SRC"/.zshenv "$DEST"

_done "zsh and oh-my-zsh were installed!"
