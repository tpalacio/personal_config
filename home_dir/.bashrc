# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias home='cd ~/'
# export EDITOR='rmate -w'
export EDITOR='emacs'
export GIT_EDITOR='emacs'

#eval $(~/development/DevTools/dbaliases)

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export GITHUB_URL=http://github.com/RentTheRunway2
