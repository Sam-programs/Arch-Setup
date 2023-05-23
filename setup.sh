sudo pacman -S xorg-drivers
sudo pacman -S xf86-video-vmware --noconfirm

mkdir ~/.config/
prompt "are you connected to wifi ?" || 
echo   "connect to wifi then come back thanks" &&
exit

#this is hear because i don't know how to detect if the user didn't install a package
function promopt(){
read -p "$1 [y/n]? " yn 
case $yn in
        [Yy]* ) return 0;;
        [Nn]* ) return 1;;
        * )     return 0;;
esac
}

function pacman_install(){
read -p "Do you want to install $1 ? [y/n]? " yn 
case $yn in
        [Yy]* ) sudo pacman -S -"$1" -quiet --noconfirm;return 0;;
        [Nn]* ) return 1;;
        * ) sudo pacman -S "$@" --noconfirm --quiet;return 0;;
esac
}

function dependency_install(){
 sudo pacman -S $@ --noconfirm --quiet
}


#optional stuff  

read -p "Do you want my bashrc ? [y/n]? " yn 
case $yn in
        [Yy]* ) sudo cp -f ./.bashrc;mkdir ~/code/;;
        [Nn]* ) ;;
        * ) sudo cp -f ./.bashrc;mkdir ~/code/;;
esac

echo "install lightdm or you'ill have to start bspwm with startx"
pacman_install lightdm 
dependency_install lightdm-slick-greeter &&
lightdm_installed="yes" &&
sudo cp -f /etc/lightdm/lightdm.conf /etc/lightdm/original-lightdm.conf &&
sudo cp -f lightdm.conf /etc/lightdm/lightdm.conf
 
function lightdm_launch(){
 if [ -z $1 ]; then
 
 else 
 ln -s -f ~/.xinitrc ~/.xsession
 sudo chmod +x ~/.xsession #just in case
 sudo systemctl enable --now lightdm
 if
}


echo "check the xinitrc to turn off start up apps that u remove"
echo "start-up apps(recommeneded):"

echo "the script in~/.config/sxhkd/powermenu.sh requires this but u don't need it" 
pacman_install light-locker

echo "in case u don't know feh is for it's for the wallpaper"
pacman_install feh &&
cp -f ./.fehbg ~ &&
sudo chmod +x ~/.fehbg &&
mkdir ~/Pictures/ &&
cp -f ./bg.png ~/Pictures/ 

echo "flameshot for screenshots"
pacman_install flameshot

echo "top bar"
pacman_install polybar &&
mkdir ~/.config/polybar &&
cp -r ./.config/polybar 

echo "clipboard server"
pacman_install copyq &&
mkdir ~/.config/copyq

echo "xorg compositor for the terminal opacity to work properly"
echo "for the people coming from other distros this is basically compton"
pacman_install picom && 
sudo cp /etc/xdg/picom.conf /etc/xdg/original-picom.conf && 
sudo cp picom.conf /etc/xdg/picom.conf

echo "end of start-up apps"

pacman_install zip

pacman_install clang
pacman_install gdb

pacman_install lld &&
sudo cp -f /usr/bin/ld /usr/bin/orginal-ld &&
sudo ln -s -f /usr/bin/ld.lld /usr/bin/ld

#neovim
function setup_neovim(){ 
sudo git clone https://github.com/Sam-programs/simple-neovim-setup &&
sudo chmod +x ./simple-neovim-setup/setup.sh &&
cd ./simple-neovim-setup &&
./setup.sh
}

pacman_install neovim &&
dependency_install xsel &&
read -p "Do you want my neovim setup ? [y/n]? " yn &&
case $yn in
        [Yy]* ) setup_neovim;;
        [Nn]* ) ;;
        * ) setup_neovim;;
esac


pacman_install pulseaudio

echo "installing apps required by the setup to function properly"

dependency_install rofi rofi-calc #rofi-calc is optional but u would get annoying warnings from rofi

dependency_install -S bspwm sxhkd
mkdir ~/.config/bspwm
cp -rf ./.config/bspwm ~/.config/bspwm/
mkdir ~/.config/sxhkd
cp -rf ./.config/sxhkd ~/.config/sxhkd/

dependency_install xorg-server xorg-xinit
cp -rf ./.xinitrc ~
sudo chmod +x ~/.xinitrc

dependency_install alacritty ttf-firacode-nerd #the font is used in the alacritty config
mkdir ~/.config/alacritty
cp -rf ./.config/alacritty/ ~/.config/alacritty

#vim here is for manpages and hotkey manual in xinitrc
dependency_install vim


lightdm_launch "$lightdm_installed"
