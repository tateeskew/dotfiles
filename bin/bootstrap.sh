#!/bin/bash
#still getting this right.  this may blow up your machine. may. blow. up.
#i have a salt machine setup to bootstrap the prerequisites. you'll have to do that on your own.

#exit if something fails
set -e

echo "prerequisites: python git pip weechat hg ack zsh vim"

function ensure_link {
    test -L "$HOME/$2" || ln -s "$HOME/$1" "$HOME/$2"
}

mkdir -p ~/lib/hg
mkdir -p ~/lib/virtualenvs
mkdir -p ~/bin
mkdir -p ~/sourcecode

ensure_link "lib/dotfiles/hgrc" ".hgrc"

test -d ~/.hg-git/    || hg clone "https://bitbucket.org/durin42/hg-git" "$HOME/.hg-git"


# install oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

test -d ~/lib/dotfiles || git clone --recursive https://github.com/tateeskew/dotfiles.git ~/lib/dotfiles

ensure_link "lib/dotfiles/vim"                 ".vim"
ensure_link "lib/dotfiles/vimrc"               ".vimrc"
ensure_link "lib/dotfiles/gitconfig"           ".gitconfig"
ensure_link "lib/dotfiles/ackrc"               ".ackrc"
ensure_link "lib/dotfiles/weechat"             ".weechat"
ensure_link "lib/dotfiles/hgignore"            ".hgignore"
ensure_link "lib/dotfiles/pythonrc.py"         ".pythonrc.py"
ensure_link "lib/dotfiles/bashrc"              ".bashrc"
ensure_link "lib/dotfiles/zshrc"               ".zshrc"
ensure_link "lib/dotfiles/tates.zsh-theme"     ".oh-my-zsh/themes/tates.zsh-theme"

echo completed
