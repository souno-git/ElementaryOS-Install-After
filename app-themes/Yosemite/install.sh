#!/bin/bash
echo "This script will ask for sudo rights in order to copy files to the theme directory."
echo " "
echo "Installing..."
sudo cp -r minimum /boot/burg/themes
echo "Setting permissions..."
sudo chmod -R 755 /boot/burg/themes/minimum/
echo "..."
echo "Installation finished ! Enjoy ! :D"
