pacman -Qe | awk '{print $1}' > packages.txt
pacman -Qmq > aur-packages.txt
