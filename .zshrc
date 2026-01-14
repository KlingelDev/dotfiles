# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="psychotropic"

zstyle ':omz:update' mode auto      # update automatically without asking
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

SAVEHIST=50000
HISTSIZE=20000

setopt SHARE_HISTORY
setopt APPEND_HISTORY

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS

plugins=(git colorize copybuffer)

ZSH_COLORIZE_TOOL=pygmentize
ZSH_COLORIZE_STYLE="colorful"

export LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

source $ZSH/oh-my-zsh.sh

export CC=/usr/bin/clang
export CXX=/usr/bin/clang++

export GPG_TTY=$(tty)

export TERM=xterm-256color

export GTK_THEME=Breeze:dark
export QT_QPA_PLATFORMTHEME="qt5ct"
export XCURSOR_SIZE=23

export PATH=$PATH:/usr/bin:~/.cargo/bin:~/.npm-global/bin:~/.local/bin:~/.venv/bin

bindkey '^[OA' up-line-or-history
bindkey '^[OB' down-line-or-history

export EDITOR='nvim'
export APT_PAGER=cat

alias vim="nvim"
alias ll="ls -lha"
alias l="ls -lh"

# SSH
#alias ssh="kitten ssh"
alias sshadd="ssh-add ~/.ssh/khruskowski_optris_admin_01; ssh-add ~/.ssh/KlingelDev"

# Coding
alias pytree="tree -I __pycache__ -I __init__.py"
alias agpersonal="antigravity --user-data-dir /home/karl/.agprofiles/personal --extensions-dir /home/karl/.agprofiles/personal-extensions ~/dev/otc"
alias agwork1="antigravity --user-data-dir /home/karl/.agprofiles/work1 --extensions-dir /home/karl/.agprofiles/work1-extensions ~/dev/otc"
alias agwork2="antigravity --user-data-dir /home/karl/.agprofiles/work2 --extensions-dir /home/karl/.agprofiles/work2-extensions ~/dev/otc"

# AsyncAPI CLI Autocomplete

ASYNCAPI_AC_ZSH_SETUP_PATH=/home/karl/.cache/@asyncapi/cli/autocomplete/zsh_setup && test -f $ASYNCAPI_AC_ZSH_SETUP_PATH && source $ASYNCAPI_AC_ZSH_SETUP_PATH; # asyncapi autocomplete setup
# Work Identity: Enterprise pixconnect (Uses Vertex AI pool)
alias gwork1='HOME=$HOME/.gemini-work1 \
GOOGLE_CLOUD_PROJECT="pixconnect" \
GOOGLE_GENAI_USE_VERTEXAI=true \
GOOGLE_CLOUD_LOCATION=us-east1 \
GOOGLE_APPLICATION_CREDENTIALS="$HOME/.config/gcloud/application_default_credentials.json" \
GOOGLE_API_ENDPOINT="aiplatform.googleapis.com" \
gemini'

alias gwork2='HOME=$HOME/.gemini-work2 gemini'
alias gwork3='HOME=$HOME/.gemini-work3 gemini'
alias gwork4='HOME=$HOME/.gemini-work4 gemini'


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/karl/opt/google-cloud-sdk/path.zsh.inc' ]; then . '/home/karl/opt/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/karl/opt/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/karl/opt/google-cloud-sdk/completion.zsh.inc'; fi
