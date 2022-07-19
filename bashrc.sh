#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls="ls --color=auto"
alias ll="ls -alhF"

# dotfiles
alias dotconfig="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"

# bash profile
# PS1="[\u@\h \W]\$ "
PS1="\[\033[38;5;225m\]\u\[\] 🫐 \[\]\[\033[38;5;158m\]\w\[\] \[\]\[\033[38;5;189m\][\t]\[\] \[\]\[\033[38;5;159m\]$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[\]\$ \[\]"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ip address
# ip a | grep inet

# using this file
# cp bashrc.sh ~/.bashrc
# source ~/.bashrc
