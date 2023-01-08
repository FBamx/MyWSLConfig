export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git
         zsh-autosuggestions
         zsh-syntax-highlighting
         extract
        )

source $ZSH/oh-my-zsh.sh

alias vim=nvim
alias kc=kubectl
alias kb=kubebuilder
alias proxy=proxy.sh
alias proxy="source /root/proxy.sh"
. /root/proxy.sh set

export PATH=$PATH:/usr/local/nvim-linux64/bin
export PATH=$PATH:/usr/local/jdk-17.0.5/bin
export PATH=$PATH:/root/go/bin
export PATH=$PATH:/root

# autojump git clone git://github.com/wting/autojump.git || cd autojump || ./install.py
[[ -s /root/.autojump/etc/profile.d/autojump.sh ]] && source /root/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u
