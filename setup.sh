sudo pacman -S xorg-drivers
sudo pacman -S xf86-video-vmware
#optional stuff  

sudo cp -f ./.bashrc  ~

sudo pacman -S lightdm lightdm-slick-greeter
#comment this function out to not launch lightdm after setup
#you'ill have to use startx to load in bspwm
function lightdm_launch(){
 ln -s -f ~/.xinitrc ~/.xsession
 sudo chmod +x ~/.xsession #just in case
 sudo systemctl enable --now lightdm 
}

sudo cp -f /etc/lightdm/lightdm.conf /etc/lightdm/original-lightdm.conf
sudo cp -f lightdm.conf /etc/lightdm/lightdm.conf

#check the xinitrc to turn off start up apps that u remove
#startup apps
sudo pacman -S xfce4-screensaver

sudo pacman -S feh 
cp -f ./.fehbg ~
sudo chmod +x ~/.fehbg
mkdir ~/Pictures/
cp -f ./bg.png ~/Pictures/

sudo pacman -S flameshot

sudo pacman -S polybar


sudo pacman -S copyq
mkdir ~/.config/
mkdir ~/.config/copyq
#

#sudo pacman -S zip

#default off
#sudo pacman -S clang lld libc++ gdb
#seting lld as the linker
#sudo cp -f /usr/bin/ld /usr/bin/ld-orginal
#sudo ln -s -f /usr/bin/ld.lld /usr/bin/ld

#neovim setup
#sudo pacman -S neovim xsel
#sudo git clone https://github.com/Sam-programs/simple-neovim-setup
#sudo chmod +x ./simple-neovim-setup/setup.sh
#./simple-neovim-setup/setup.sh

mkdir ~/code/

sudo pacman -S pulseaudio

#required for the setup to work properly
sudo pacman -S rofi rofi-calc #rofi-calc is optional but u would get annoying warnings
sudo pacman -S bspwm sxhkd
sudo pacman -S xorg-server xorg-xinit
sudo pacman -S alacritty
sudo pacman -S ttf-firacode-nerd vim #vim here is for manpages and hotkey manual in xinitrc

mkdir ~/code/

cp -f ./.xinitrc ~
sudo chmod +x ~/.xinitrc

cp -rf ./.config/ ~

lightdm_launch
