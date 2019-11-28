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
plugins=(archlinux autojump copyfile command-not-found docker extract git pip vagrant vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

#################################################################################################
#Tate's Customizations
#################################################################################################

############################################
# ALIASES                                  #
############################################
# grep aliases
# Move export GREP_OPTIONS="--color=auto" (which is deprecated) from env variable to alias
# Always enable colored `grep` output`
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# KILL evolution processes
alias killev='kill -9 $(pgrep evolution)'

# aliases for suffixes

alias -s sls=vim

# map vi to vim on redhat family

alias vi='vim'

#map sudoedit
alias se='sudoedit'

#pacman aliases

# alias pac='sudo pacman -S'   # install
# alias pacu='sudo pacman -Syu'    # update, add 'a' to the list of letters to update AUR packages if you use yaourt
# alias pacr='sudo pacman -Rs'   # remove
# alias pacs='sudo pacman -Ss'      # search
# alias paci='sudo pacman -Si'      # info
# alias paclo='sudo pacman -Qdt'    # list orphans
# alias pacro='sudo paclo && sudo pacman -Rns $(pacman -Qtdq)' # remove orphans
# alias pacc='sudo pacman -Scc'    # clean cache
# alias paclf='sudo pacman -Ql'   # list files

# pbcopy emulation for boxes with X installed

alias copy='xsel --clipboard --input'
alias paste='xsel --clipboard --output'

# Open files from command line

alias o='xdg-open'

#Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

#zshrc file
alias zshrc='${=EDITOR} ~/.zshrc'
alias sz='source ~/.zshrc'

# filesystem stuff
alias ..="cd ../"
alias ...="cd ../.."
alias ....="cd ../../.."
alias dotfiles="cd $HOME/lib/dotfiles"
alias mkdir="mkdir -p"
alias ll="ls -lh"
alias du="du -h"
alias df="df -h"
alias lnew='ls *(.om[1,3])' # list three newest
alias lh='ls -d .*' # only hidden files

# network stuff
alias spy='lsof -i -P +c 0 +M'
alias netlist='lsof -i -P | grep LISTEN'

# grab youtube stuff
alias ytvid='youtube-dl --restrict-filenames -o "~/mus/vid/%(title)s_%(width)sx%(height)s_%(upload_date)s.%(ext)s"'
alias ytaudio='youtube-dl --restrict-filenames --extract-audio -o "~/mus/%(title)s_%(width)sx%(height)s_%(upload_date)s.%(ext)s"'

#Search Git history
searchgithistory() {

    git grep $1 $(git rev-list --all)
}
alias gg="searchgithistory"

# Search files fast
f() {
    echo "find . -iname \"*$1*\""
    find . -iname "*$1*"
}


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
export HISTSIZE=100000
export HISTFILESIZE=100000
export HISTCONTROL=erasedups
export EDITOR='vim'

# Debian / Ubuntu sets these to vi-up-line-or-history etc,
# # which places the cursor at the start of line, not end of line.
# # See: http://www.zsh.org/mla/users/2009/msg00878.html
bindkey -M viins "\e[A" up-line-or-history
bindkey -M viins "\e[B" down-line-or-history
bindkey -M viins "\eOA" up-line-or-history
bindkey -M viins "\eOB" down-line-or-history

# Grab my python settings
export PYTHONSTARTUP="$HOME/.pythonrc.py"

# PATH
export PATH=/home/teskew/.venvburrito/bin:~/bin:/usr/local/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/vagrant/bin:/usr/games

# Grab my AWS keys
if [[ -f ~/Documents/AWSInformation/tates_aws_keys ]]; then
    source ~/Documents/AWSInformation/tates_aws_keys
fi

ssh-add ~/.ssh/*.pem

#ENV Variables

#Set aws-vault backend to gnome-keyring
export AWS_VAULT_BACKEND=secret-service


###########################################
# PASTEBIN PUSH                           #
###########################################

#whole file put
function pbf()
{
    local url='https://paste.c-net.org/'
    if (( $# )); then
        local file
        for file; do
            curl -s \
                --data-binary @"$file" \
                --header "X-FileName: ${file##*/}" \
                "$url"
        done
    else
        curl -s --data-binary @- "$url"
    fi
}

#text put
function pbf()
{
    local url='https://paste.c-net.org/'
    if (( $# )); then
        local text
        for text; do
            curl -s \
                --data "$text" \
                "$url"
        done
    else
        curl -s --data @- "$url"
    fi
}

#get
function pg()
{
    local url='https://paste.c-net.org/'
    if (( $# )); then
        local arg
        for arg; do
            curl -s "${url}${arg##*/}"
        done
    else
        local arg
        while read -r arg; do
            curl -s "${url}${arg##*/}"
        done
    fi
}

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
