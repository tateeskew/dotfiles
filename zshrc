# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="tates"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
 DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump pip command-not-found vagrant git mercurial vi-mode extract)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#################################################################################################
#Tate's Customizations
#################################################################################################

############################################
# ALIASES                                  #
############################################

# aliases for suffixes

alias -s sls=vim

# map vi to vim on redhat family

alias vi='vim'

# pbcopy emulation for boxes with X installed

alias copy='xsel --clipboard --input'
alias paste='xsel --clipboard --output'

# Open files from command line

alias o='xdg-open'

#Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias sz='source ~/.zshrc'

# filesystem stuff
alias ..="cd ../"
alias ...="cd ../.."
alias ....="cd ../../.."
alias dotfiles="cd $HOME/lib/dotfiles"
alias mkdir="mkdir -p"
alias ll="ls -lh"

############################################
# VARIOUS SETTINGS                         #
############################################

# options

setopt extended_history
setopt auto_cd
setopt no_cdable_vars # don't use named directories in cd autocompletion damnit.
setopt no_nomatch # if there are no matches for globs, leave them alone and execute the command

# zsh quit trying to correct every goddamn thing i use through sudo!
alias sudo='nocorrect sudo'

# Set term colors to 256 - If you use byobu/tmux, use the screen-256color line.  This will make it so weechat works as expected.
TERM=xterm-256color
#TERM=screen-256color

# Let's set some env variables
export HISTSIZE=1000
export HISTFILESIZE=1000
export HISTCONTROL=erasedups
export EDITOR='vim'
export GREP_OPTIONS='--color=auto'

# Grab my python settings
export PYTHONSTARTUP="$HOME/.pythonrc.py"

# Mercurial and PATH
export DRS_HG_TOOLS=~/Tools/drs-hg-tools/
export PATH=/home/teskew/.venvburrito/bin:/usr/local/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/vagrant/bin:/usr/games

# Grab my AWS keys
if [[ -f ~/Documents/AWSInformation/tates_aws_keys ]]; then
    source ~/Documents/AWSInformation/tates_aws_keys
fi


###########################################
# HOW MUCH RAM IS A PROCESS USING         #
# #########################################

function ram() {
  local sum
  local items
  local app="$1"
  if [ -z "$app" ]; then
    echo "First argument - pattern to grep from processes"
  else
    sum=0
    for i in `ps aux | grep -i "$app" | grep -v "grep" | awk '{print $6}'`; do
      sum=$(($i + $sum))
    done
    sum=$(echo "scale=2; $sum / 1024.0" | bc)
    if [[ $sum != "0" ]]; then
      echo "${fg[blue]}${app}${reset_color} uses ${fg[green]}${sum}${reset_color} MBs of RAM."
    else
      echo "There are no processes with pattern '${fg[blue]}${app}${reset_color}' are running."
    fi
  fi
}
