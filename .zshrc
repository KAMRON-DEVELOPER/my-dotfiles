setopt histignorealldups sharehistory

HISTSIZE=1000
SAVEHIST=1000

HISTFILE=~/.zsh_history


################################### CUSTOM ###########################################


# Bind Ctrl+Left to backward-word
bindkey '^[[1;5D' backward-word

# Bind Ctrl+Right to forward-word
bindkey '^[[1;5C' forward-word


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# zsh-syntax-highlighting and zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


# flutter
export PATH="$HOME/flutter/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable


# commandline-tools
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="$ANDROID_HOME/emulator:$PATH"

QT_QPA_PLATFORM="wayland;xcb"

alias Pixel_3='setsid emulator -avd Pixel_3 -no-snapshot -gpu host >/dev/null 2>&1 &'
alias Pixel_3a_XL='setsid emulator -avd Pixel_3a_XL -no-snapshot -gpu host >/dev/null 2>&1 &'

# java 17
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
export PATH="$JAVA_HOME/bin:$PATH"


# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# nvm node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# waypaper
export XDG_CONFIG_HOME="$HOME/.config"


# Rust rust-bert libtorch
export LIBTORCH=/opt/libtorch
export LD_LIBRARY_PATH=/opt/libtorch/lib:$LD_LIBRARY_PATH


# system alias
alias syu="sudo pacman -Syu"
alias nvimconf="nvim ~/.config/nvim/init.lua"
alias killuvicorn="lsof -ti:8000 | xargs -r kill -9"


# Unalias nvimdir if it exists
unalias nvimdir 2>/dev/null
nvimdir() {
    if [ -z "$1" ]; then
        cd ~/.config/nvim/
    else
        cd ~/.config/nvim/"$1" || echo "Directory not found: ~/.config/nvim/$1"
    fi
}


# git add, commit, push
function acp() {
  git add .
  git commit -m "$1"
  git push
}

export LIBVIRT_DEFAULT_URI='qemu:///system'

login_user() {
  local username=$1
  local password

  case $username in
    kamronbek)
      password='@kamronbek2003'
      ;;
    adhambek)
      password='@adhambek2007'
      ;;
    alisher)
      password='@alisher2009'
      ;;
    kumush)
      password='@kumush2010'
      ;;
    *)
      echo "Unknown user: $username"
      return 1
      ;;
  esac

  curl -X POST http://localhost:8000/api/v1/users/auth/login \
    -H "Content-Type: application/json" \
    -d "{\"username\":\"$username\", \"password\":\"$password\"}" | jq
}

alias http_login='http POST localhost:8000/api/v1/users/auth/login username=kamronbek password="\@kamronbek2003"'

alias http_login_with_password='read -s PASS; http POST localhost:8000/api/v1/users/auth/login username=kamronbek password="\$PASS"'

alias pglk='psql "sslmode=verify-full sslrootcert=/home/kamronbek/certs/ca/ca.pem sslcert=/home/kamronbek/certs/client/client-cert.pem sslkey=/home/kamronbek/certs/client/client-key.pem host=localhost port=5432 user=kamronbek dbname=dev_db"'

alias pgrk='psql "psql "sslmode=verify-full sslrootcert=/home/kamronbek/certs/ca/ca.pem sslcert=/home/kamronbek/certs/client/client-cert.pem sslkey=/home/kamronbek/certs/client/client-key.pem host=localhost hostaddr=127.0.0.1 port=5432 user=kamronbek dbname=kronk_db"'

alias rclk='redis-cli --tls --cacert ~/certs/ca/ca.pem --cert ~/certs/client/client-cert.pem --key ~/certs/client/client-key.pem'

alias rcrk='redis-cli --tls -h redis.kronk.uz -p 6379 --cacert ~/certs/ca/ca.pem --cert ~/certs/client/client-cert.pem --key ~/certs/client/client-key.pem'

source ~/powerlevel10k/powerlevel10k.zsh-theme

. "$HOME/.local/bin/env"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

