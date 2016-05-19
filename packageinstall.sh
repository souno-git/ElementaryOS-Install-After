#!/bin/bash

# Fixes sudo issues
if (($EUID != 0)); then
  if [[ -t 1 ]]; then
    sudo "$0" "$@"
  else
    exec 1>output_file
    gksu "$0 $@"
  fi
  exit
fi


echo "Everything is not installed here.Linux Headers are to be installed manually and some other packages via deb."

cmd='sudo apt-get update && sudo apt-get upgrade'		# What's a script without upgrade ;)
eval cmd

sudo apt-get install linux-firmware-nonfree xclip dtrx		# 非自由的基本硬件驱动

sudo apt-get install alien dpkg-dev debhelper			# 软件包安装转换工具

# 下载内核更新
sudo mkdir /tmp/kernel
cd /tmp/kernel
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0-vivid/linux-headers-4.0.0-040000-generic_4.0.0-040000.201504121935_amd64.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0-vivid/linux-headers-4.0.0-040000_4.0.0-040000.201504121935_all.deb
wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0-vivid/linux-image-4.0.0-040000-generic_4.0.0-040000.201504121935_amd64.deb

# 安装内核
sudo dpkg -i *.deb

sudo apt-get install build-essential			# linux构建工具，可能为更新

#修复gtk主题bug
sudo apt-get -y install synaptic gtk2-engines-pixbuf libcanberra-gtk-module packageKit-gtk3-module gnome-themes-standard xpad

#Flags
# sudo mkdir /usr/share/icons/flags
# cd /usr/share/icons/flags
# sudo wget http://suservice.net/icons/flags2/{ru,us}.png
# gsettings set org.gnome.libgnomekbd.indicator show-flags true

#鼠标光标消失修复
gsettings set org.gnome.settings-daemon.plugins.cursor active false
#4k正常的字体
gsettings set org.gnome.desktop.interface text-scaling-factor 1.05

sudo apt-get -y install vim git aria2 uget elementaryplus

# 我需要的软件包 :)
cmd='sudo apt-get install elementary-tweaks skype transmission rar unrar p7zip-rar p7zip sharutils uudeview mpack arj cabextract lzip lunzip oracle-java8-installer oracle-java8-set-default oracle-java8-unlimited-jce-policy flashplugin-installer pepperflashplugin-nonfree vlc ubuntu-restricted-extras ffmpeg gstreamer0.10-plugins-ugly libavcodec-extra-54 libvdpau-va-gl1 libmad0 mpg321 gstreamer1.0-libav tlp tlp-rdw rar hourglass relay elementary-plus configurator evnc feedreader go-for-it envelope taxi power-installer nasc anoise apt-fast axel'
eval cmd

# RVM and Ruby Installer
#command curl -sSL https://rvm.io/mpapis.asc | gpg --import -
#curl -sSL https://get.rvm.io | bash -s stable
#rvm get stable --auto-dotfiles
#echo "source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --autolibs=enabled --rails --ruby

# NVM and node install
curl https://raw.githubusercontent.com/creationix/nvm/v0.11.1/install.sh | bash
source $HOME/.profile
nvm install 0.10.40
nvm alias default 0.10.40
nvm use default

sudo /usr/share/doc/libdvdread4/install-css.s­h	# Enable DVD Playback
sudo apt-get install ttf-mscorefonts-installer	# Microsoft Fonts
sudo apt-get install libavcodec-extra-53		# Itunes compatibility Codec
sudo apt-get install bleachbit					# System Cleaner BleachBit
sudo apt-get -y install firefox
sudo apt-get -y install atom					# ATOM editor

##
## Python related
##

sudo apt-get install virtualenv
sudo apt-get install virtualenvwrapper


##
## Node and IoJS install for root
##
sudo apt-get install nodejs
sudo apt-get install iojs

##
## Setup the Solarized Dark theme for gnome-terminal but not right now :D
##
# gtcbin="`(mktemp -d)`/solarize"
# git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git "`(dirname \"$gtcbin\")`"
# "$gtcbin" dark

##
## Setup Zsh.Framework for this must be installed.Your choice No Hurry :D
##
sudo apt-get install -y git zsh
echo "Framework for ZSH must be installed.Your choice No Hurry :D"
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Extra Stuff you may wanna install

sudo apt-get install gimp						# U always want gimp but don't use it :/
sudo apt-get install translator					# Translator App not that in any Use Case
sudo apt-get install corebird 					# Twitter Client
sudo apt-get install webby-browser 				# System Web Apps
sudo apt-get install currency 					# Currency Convertor
sudo apt-get install eradio 					# Audio Streaming player
sudo apt-get install fantasy		 			# Book reader app
sudo apt-get install uberwriter 				# Markdown writer app
sudo apt-get install foto 						# Photo manager
sudo apt-get install birdie 					# Twitter Client
sudo apt-get install agenda-tasks 				# Task Management like go-For-it
sudo apt-get install boot-repair				# Boot Repair Tool
sudo apt-get install clementine					# Clementine Music Player
sudo apt-get install darktable					# Darktable

# AV Codec and some other additions
sudo apt-get install libavcodec-extra-54 libavcodec-extra-54 aptitude mplayer indicator-multiload gdebi-core

# Install Sails JS
sudo npm -g install sails

# Install Metoer JS & Meteor Kitchen
curl https://install.meteor.com/ | bash

curl http://www.meteorkitchen.com/install | /bin/sh

# 主题

: <<'theme_plank'

sudo apt-get -y install plank-theme-capeos
sudo apt-get -y install plank-theme-cratos-lion
sudo apt-get -y install plank-theme-grantheon
sudo apt-get -y install plank-theme-korora
sudo apt-get -y install plank-theme-pantiva
sudo apt-get -y install plank-theme-paperterial.
sudo apt-get -y install plank-theme-rainier
sudo apt-get -y install numix-plank-theme
sudo apt-get -y install plank-theme-pantiva
sudo apt-get -y install plank-theme-paperterial.
sudo apt-get -y install plank-theme-rainier

theme_plank

: <<'theme_icons'

sudo apt-get -y install paper-icon-theme
sudo apt-get -y install elementary-add-icon-theme
sudo apt-get -y install elementary-enhanced
sudo apt-get -y install numix-icon-theme numix-icon-theme-circle numix-icon-theme-bevel
sudo apt-get -y install captiva-icon-theme
sudo apt-get -y install ieos7-icons

theme_icons

: <<'theme_gtk'

sudo apt-get -y install arc-theme
sudo apt-get -y install paper-gtk-theme
sudo apt-get -y install elementary-yo
sudo apt-get -y install vertex-gtk3
sudo apt-get -y install numix-gtk-theme
sudo apt-get -y install elementary-wallpapers-extra

theme_gtk

echo "##################################################"
echo "               SHENYA AUTO SCRIPT!                "
echo "##################################################"
echo "Other DEB packages include : "
echo "- nginx"
echo "- WPS"
echo "- linux-headers and image preferably 4.0.0 - Done "
echo "- Uget,Atom,Sublime should be installed if not download DEB and install"
echo "- indicator-Workspaces"
echo "- indicator-synapse"
echo "- Android Studio"
echo "- bashrc patches"
echo "- zsh install with oh-my-zsh"
echo ""
echo "More things to do : "
echo ""
echo "- Configure Atom,Sublime and System Settings"
echo "- Install LAMP,Configure Workspace"
echo "- Add the backbox install methods to the install script"
echo "- Edit Fstab for NTFS automount"
echo "- Add xpad,tlp to startup items"
echo "- Add open_terminal_here,open_as_root to context"
echo "- Install Atom Theme,Fix Wifi Solutions from Git Repo"
echo ""
echo "#######################################################################"
echo "                       Default Setup Complete                          "
echo "#######################################################################"
echo ""
