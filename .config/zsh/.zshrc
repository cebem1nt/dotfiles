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

export SCRIPTS="$HOME/.local/bin"
export PATH="$SCRIPTS:$HOME/.config/npm/bin:$HOME/.local/share/go/bin:$PATH"

export LESS="-R --ignore-case"

# eza -al format ouput to diference permissions
export EZA_COLORS="ur=32:uw=32:ux=32:gr=36:gw=36:gx=36:tr=31:tw=31:tx=31"

alias ls='eza -a --git --icons=auto --group-directories-first'
alias ll='eza -al'
alias lt='eza -a --tree --level=2 --group-directories-first --icons=auto'

alias man="COLUMNS=100 man"
alias vi='nvim'
alias vim='nvim'
alias ht='htop'
alias code='codium'
alias g='grep'
alias y='yazi'
alias aur="pacget --storage-dir=$HOME/.local/src/"

alias vimzshrc="vim $XDG_CONFIG_HOME/zsh/.zshrc"
alias vimsudo='sudo -E nvim /etc/sudoers'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias mv='mv -v'
alias perfrun='perforun'

bindkey '^H' backward-kill-word
bindkey -r '^S'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
