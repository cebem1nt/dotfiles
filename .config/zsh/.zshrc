export ZSH="$HOME/.config/oh-my-zsh"
ZSH_THEME="lukerandall"

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-shift-select
)


source $ZSH/oh-my-zsh.sh

zstyle ':completion:*' special-dirs true
setopt autocd

export PATH="$HOME/.local/bin/:$HOME/.config/npm/bin:$PATH"

export XDG_STATE_HOME="$HOME/.local/state"
export XDG_SRC_HOME="$HOME/.local/src"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="zen"

export LESS="--ignore-case"

export CARGO_HOME="$HOME/.config/rust-cargo"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc":"$XDG_CONFIG_HOME/gtk-2.0/gtkrc.mine"
export KEEPER_STORAGE_DIR="$XDG_STATE_HOME/keeper_storage"
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export MYSQL_HISTFILE="$XDG_DATA_HOME/mysql/history"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"


export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

export CUDA_CACHE_PATH="$XDG_CACHE_HOME/cuda"
export __GL_SHADER_DISK_CACHE=1
export __GL_SHADER_DISK_CACHE_PATH="$XDG_CACHE_HOME/nv"
export __GL_SHADER_DISK_CACHE_SKIP_CLEANUP=1
export __GL_THREADED_OPTIMIZATIONS=0

# eza -al format ouput to diference permissions
export EZA_COLORS="ur=32:uw=32:ux=32:gr=36:gw=36:gx=36:tr=31:tw=31:tx=31"

alias ls='eza -a --git --icons=automatic --group-directories-first'
alias ll='eza -al'
alias lt='eza -a --tree --level=2 --group-directories-first --icons=automatic'

alias man="COLUMNS=100 man"
alias vim='nvim'
alias ht='htop'
alias code='codium'
alias g='grep'
alias aur="pacget --storage-dir $XDG_SRC_HOME"

alias vimzshrc="vim $XDG_CONFIG_HOME/zsh/.zshrc"
alias vimsudo='sudo -E nvim /etc/sudoers'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias mv='mv -v'

bindkey '^H' backward-kill-word
bindkey -r '^S'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
