setopt histignorealldups sharehistory

HISTSIZE=1000
SAVEHIST=1000

HISTFILE=~/.zsh_history

################################### CUSTOM ###########################################

# Bind Ctrl+Left to backward-word
bindkey '^[[1;5D' backward-word

# Bind Ctrl+Right to forward-word
bindkey '^[[1;5C' forward-word

# zsh-syntax-highlighting and zsh-autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# android sdk
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="$ANDROID_HOME/emulator:$PATH"

# java 17
export JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
export PATH="$JAVA_HOME/bin:$PATH"

# flutter
export PATH="$HOME/flutter/bin:$PATH"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
export PATH="$HOME/fvm/default/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# nvm node version manager
export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. /usr/share/nvm/init-nvm.sh

# git add, commit, push
function acp() {
  git add .
  git commit -m "$1"
  git push
}

# waypaper
export XDG_CONFIG_HOME="$HOME/.config"

export LIBVIRT_DEFAULT_URI='qemu:///system' 

eval "$(starship init zsh)"


## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/kamronbek/.config/.dart-cli-completion/zsh-config.zsh ]] && . /home/kamronbek/.config/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

