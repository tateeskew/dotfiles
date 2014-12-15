#!/bin/bash
#still getting this right.  this may blow up your machine. may. blow. up.
#i have a salt machine setup to bootstrap the prerequisites. you'll have to do that on your own.

# let's set some stuff up
USER=`id -un`
eval PROGRAMS=('python' 'git' 'weechat-curses' 'hg' 'vim' 'zsh' 'autojump')
eval FILES=('~/.vim' '~/.vimrc' '~/.gitconfig' '~/.ackrc' '~/.weechat' '~/.hgignore' '~/.pythonrc.py' '~/.zshrc' '~/.hgrc') 

#exit if something fails
set -e

echo "Prerequisites: python git weechat hg ack zsh vim autojump (if CentOS, autojump-zsh)"

for program in "${PROGRAMS[@]}"; do
    command -v $program >/dev/null 2>&1 || { echo >&2 "I require $program, but it's not installed.  Aborting."; exit 1; }
done

symlink() {
    test -L "$HOME/$2" || ln -s "$HOME/$1" "$HOME/$2"
}

mkdir -p ~/lib/hg
mkdir -p ~/lib/virtualenvs
mkdir -p ~/bin
mkdir -p ~/sourcecode

# install oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | /bin/bash

test -d ~/lib/dotfiles || git clone --recursive https://github.com/tateeskew/dotfiles.git ~/lib/dotfiles

# make backups of current dotfiles
BACKUPDIR=~/$USER-dotfilebackup
# remove previous backups
rm -rf $BACKUPDIR
mkdir $BACKUPDIR

for file in "${FILES[@]}"; do
    if [ -e "$file" ]; then
        mv $file $BACKUPDIR/.
    fi
done

# make symlinks
symlink "lib/dotfiles/hgrc"                ".hgrc"
symlink "lib/dotfiles/vim"                 ".vim"
symlink "lib/dotfiles/vimrc"               ".vimrc"
symlink "lib/dotfiles/gitconfig"           ".gitconfig"
symlink "lib/dotfiles/ackrc"               ".ackrc"
symlink "lib/dotfiles/weechat"             ".weechat"
symlink "lib/dotfiles/hgignore"            ".hgignore"
symlink "lib/dotfiles/pythonrc.py"         ".pythonrc.py"
symlink "lib/dotfiles/zshrc"               ".zshrc"
symlink "lib/dotfiles/tates.zsh-theme"     ".oh-my-zsh/themes/tates.zsh-theme"

# cp binaries/scripts
cp lib/dotfiles//bin/* bin/.

# install hg-git
test -d ~/.hg-git/ || hg clone "https://bitbucket.org/durin42/hg-git" "$HOME/.hg-git"

echo "Completed.  If during the Oh-My-Zsh install above you noticed an Authentication failure, you will need to run ' chsh -s $(which zsh) ' again, as it will prompt you for your password."
