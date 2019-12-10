#!/bin/bash
#still getting this right.  this may blow up your machine. may. blow. up.
#i have a salt machine setup to bootstrap the prerequisites. you'll have to do that on your own.

# let's set some stuff up
USER=`id -un`
eval PROGRAMS=('byobu' 'python' 'git' 'vim' 'zsh' 'autojump')
eval FILES=('~/.vim' '~/.vimrc' '~/.gitconfig' '~/.ackrc' '~/.pythonrc.py' '~/.zshrc') 

#exit if something fails
set -e

echo "Prerequisites: byobu python git ack zsh vim autojump (if CentOS, autojump-zsh)"

for program in "${PROGRAMS[@]}"; do
    command -v $program >/dev/null 2>&1 || { echo >&2 "I require $program, but it's not installed.  Aborting."; exit 1; }
done

symlink() {
    test -L "$HOME/$2" || ln -s "$HOME/$1" "$HOME/$2"
}

mkdir -p ~/lib/virtualenvs
mkdir -p ~/bin
mkdir -p ~/sourcecode

# install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

test -d ~/lib/dotfiles || git clone --recursive https://github.com/tateeskew/dotfiles.git ~/lib/dotfiles

# make backups of current dotfiles
BACKUPDIR=~/backup/$USER-dotfilebackup
# remove previous backups
rm -rf $BACKUPDIR
mkdir -p $BACKUPDIR

for file in "${FILES[@]}"; do
    if [ -e "$file" ]; then
        mv $file $BACKUPDIR/.
    fi
done

# make symlinks
symlink "lib/dotfiles/vim"                 ".vim"
symlink "lib/dotfiles/vimrc"               ".vimrc"
symlink "lib/dotfiles/gitconfig"           ".gitconfig"
symlink "lib/dotfiles/ackrc"               ".ackrc"
symlink "lib/dotfiles/pythonrc.py"         ".pythonrc.py"
symlink "lib/dotfiles/zshrc"               ".zshrc"
symlink "lib/dotfiles/tates.zsh-theme"     ".oh-my-zsh/themes/tates.zsh-theme"
symlink "lib/dotfiles/tmux.conf"           ".byobu/.tmux.conf"

#install tmuxterm.txt to get italics, strikethrough, underline, etc
tic -x tmuxterm.txt

# cp binaries/scripts
cp ~/lib/dotfiles/bin/* ~/bin/.

echo "Completed.  If during the Oh-My-Zsh install above you noticed an Authentication failure, you will need to run ' chsh -s $(which zsh) ' again, as it will prompt you for your password."
