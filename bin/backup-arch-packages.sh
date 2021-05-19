#/bin/sh

# crontab -e
# 0 18 * * * /home/teskew/bin/backup-arch-packages.sh
# To Restore packages from the arch.packages list run the following
# https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#List_of_installed_packages

pacman -Qe | awk '{ print $1 }' > /home/teskew/lib/dotfiles/arch.packages
