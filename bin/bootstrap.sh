#!/bin/bash
#still getting this right.  this may blow up your machine. may. blow. up.
#i have a salt machine setup to bootstrap the prerequisites. you'll have to do that on your own.

#exit if something fails
set -e

echo "prerequisites: python git pip dulwich weechat hg ack zsh vim"

function ensure_link {
    test -L "$HOME/$2" || ln -s "$HOME/$1" "$HOME/$2"
}

mkdir -p ~/lib/hg
mkdir -p ~/lib/virtualenvs
mkdir -p ~/bin
mkdir -p ~/sourcecode

ensure_link "lib/dotfiles/hgrc" ".hgrc"

test -d ~/.hg-git/    || hg clone "https://bitbucket.org/durin42/hg-git" "$HOME/.hg-git"
test -d ~/lib/dulwich || git clone "git://github.com/jelmer/dulwich.git" "$HOME/lib/dulwich"

# install dulwich

cd "$HOME/lib/dulwich/" ; sudo python setup.py install ; cd -
# ensure_link "lib/dulwich/dulwich" "lib/hg/hg/dulwich"

test -d ~/lib/dotfiles || git clone --recursive https://github.com/tateeskew/dotfiles.git ~/lib/dotfiles

ensure_link "lib/dotfiles/vim"                 ".vim"
ensure_link "lib/dotfiles/vim/vimrc"           ".vimrc"
ensure_link "lib/dotfiles/gitconfig"           ".gitconfig"
ensure_link "lib/dotfiles/ackrc"               ".ackrc"
ensure_link "lib/dotfiles/weechat"             ".weechat"
ensure_link "lib/dotfiles/hgignore"            ".hgignore"
ensure_link "lib/dotfiles/pythonrc.py"         ".pythonrc.py"

echo completed
