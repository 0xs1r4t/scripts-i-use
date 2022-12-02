# search for packages
# arch linux!

# list of installed packages
pacman -Q

# search for certain installed packages
pacman -Q | grep <package_name>

# search for certain packages in AUR
pacman -Ss <package_name>
