#!/bin/sh
echo " ##################################################################"
echo " #############   The Environment Is Ready  ########################"
echo " ##################################################################"
rm -rf ~/.config 2>/dev/null && mkdir -p ~/{.config,.local/share}
cd && mv wayland-void ~/.local/

echo "#########################################"
echo "###### Link My Dotfiles Programme #######"
echo "#########################################"
echo "===========> In ~/.config <================"
for config in $(ls $HOME/.local/wayland-void/void-dotfiles/cfg); do
    ln -sf ~/.local/wayland-void/void-dotfiles/cfg/$config ~/.config/
done
echo "=========> In ~/.local/share <============="
ln -sf ~/.local/wayland-void/void-dotfiles/fonts ~/.local/share/
ln -sf ~/.local/wayland-void/void-dotfiles/themes ~/.local/share/
ln -sf ~/.local/wayland-void/void-dotfiles/icons ~/.local/share/
echo "===============> In ~/ <==================="
ln -sf ~/.local/wayland-void/void-dotfiles/bsh/.bashrc ~/
ln -sf ~/.local/wayland-void/void-dotfiles/bsh/.bash_profile ~/
ln -sf ~/.local/wayland-void/void-dotfiles/others/.npmrc ~/
ln -sf ~/.local/wayland-void/void-dotfiles/git/.gitconfig ~/
echo "============> In /etc ~/ <================="
# For Boot Slince And Hide All Logs Messages: #
#=============================================#
sudo ln -sf ~/.local/wayland-void/void-dotfiles/etc/grub/grub /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
# echo "#########################################"
# echo "######    Directory In HOME       #######"
# echo "#########################################"
LC_ALL=C.UTF-8 xdg-user-dirs-update --force 2> /dev/null
mkdir -p ~/{Projects,Pictures,Desktop,Documents,Downloads,Music,Public,Videos}
ln -sf ~/.local/wayland-void/void-dotfiles/pix ~/Pictures/

echo "########################################"
echo "######     managment Services   ########"
echo "########################################"
sudo ln -s /etc/sv/elogind /var/service/
sudo ln -s /etc/sv/dbus /var/service/
sudo ln -s /etc/sv/NetworkManager /var/service/
sudo ln -s /etc/sv/bluetoothd /var/service/
# sudo ln -s /etc/sv/at /var/service/
# sudo ln -s /etc/sv/cronie /var/service/

echo "########################################"
echo "#####     Others Configurations  #######"
echo "########################################"
# Pipewire Wireplumper pipewire-pulse alsa-pipewire: #
#====================================================#
## Wireplumper And Pipweire-pulse
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/
## Alsa
sudo mkdir -p /etc/alsa/conf.d
sudo ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
sudo ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d
# Using doas Like sudo Without Password: #
#========================================#
sudo bash -c "echo 'permit nopass lli as root' > /etc/doas.conf"
