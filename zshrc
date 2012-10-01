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
plugins=(vagrant git mercurial)

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

# Add an "alert" alias for long running commands.  Use like so:
# #   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

############################################
# VARIOUS SETTINGS                         #
############################################

# Set term colors to 256
TERM=xterm-256color

# Grab my AWS keys
if [[ -f ~/Documents/AWSInformation/tates_aws_keys ]]; then
    source ~/Documents/AWSInformation/tates_aws_keys
fi

# Grab my python settings
export PYTHONSTARTUP="$HOME/.pythonrc.py"

# Set VIM bindings
#bindkey -v

export DRS_HG_TOOLS=~/Tools/drs-hg-tools/
export PATH=/home/teskew/.venvburrito/bin:/usr/local/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
