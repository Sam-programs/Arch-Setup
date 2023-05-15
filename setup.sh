sudo pacman -S xorg-drivers
sudo pacman -S xf86-video-vmware
#optional stuff  

sudo cp -f ./.bashrc  ~

sudo pacman -S lightdm lightdm-slick-greeter
#comment this function out to not launch lightdm after setup
#you'ill have to use startx to load in bspwm
function lightdm_launch(){
 sudo ls -s -f ~/.xinitrc ~/.xsession
 sudo systemctl enable --now lightdm 
}
if then 
fi 
sudo cp -f /etc/lightdm/lightdm.conf /etc/lightdm/original-lightdm.conf
sudo cp -f lightdm.conf /etc/lightdm/lightdm.conf

#check the xinitrc to turn off start up apps that u remove
#startup apps
sudo pacman -S feh 
sudo cp -f ./.fehbg ~ 
sudo cp -f ./bg.png ~/Pictures/

sudo pacman -S flameshot

sudo pacman -S polybar


sudo pacman -S copyq
#

sudo pacman -S zip


sudo pacman -S clang lld libc++ gdb
#seting lld as the linker
sudo cp -f /usr/bin/ld /usr/bin/ld-orginal
sudo ln -s -f /usr/bin/ld.lld /usr/bin/ld

#neovim setup
sudo pacman -S neovim
sudo git clone https://github.com/Sam-programs/simple-neovim-setup
sudo ./simple-neovim-setup/setup.sh

#required for the setup to work properly
sudo pacman -S rofi rofi-calc
sudo pacman -S bspwm sxhkd
sudo pacman -S xorg-server xorg-xinit
sudo pacman -S alacritty
sudo pacman -S ttf-firacode-nerd xsel vim #vim here is for the man pages neovim for the hotkey manual in xinitrc

sudo cp -f ./.xinitrc ~

mkdir ~/code/
mkdir ~/Downloads/

sudo cp -rf ./.config/ ~


lightdm_launch()
