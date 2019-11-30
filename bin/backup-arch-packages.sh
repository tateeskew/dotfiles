#/bin/sh

# crontab -e
# 0 18 * * * /home/teskew/bin/backup-arch-packages.sh

pacman -Qe | awk '{ print $1 }' > /home/teskew/lib/dotfiles/arch.packages
