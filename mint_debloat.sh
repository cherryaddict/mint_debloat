#!/bin/bash
flatpak remote-delete flathub
sudo apt purge simple-scan* firefox* libreoffice* hexchat* hypnotix* xviewer* xreader* thingy* onboard* drawing* pix* rhythmbox* thunderbird* warpinator* mintwelcome* blueman* mintbackup* gnome-disk-utility* baobab* bulky* sticky* system-config-printer* timeshift* *flatpak* gnome-system-monitor* xed* mintupdate synaptic redshift
sudo apt purge fonts-tlwg-norasi-ttf fonts-tlwg-purisa fonts-tlwg-purisa-ttf fonts-tlwg-sawasdee fonts-tlwg-sawasdee-ttf fonts-tlwg-typewriter fonts-tlwg-typewriter-ttf fonts-tlwg-typist fonts-tlwg-typist-ttf fonts-tlwg-typo fonts-tlwg-typo-ttf fonts-tlwg-umpush fonts-tlwg-umpush-ttf fonts-tlwg-waree fonts-tlwg-waree-ttf
sudo dpkg-reconfigure fontconfig
sudo journalctl --vacuum-size=40M
sudo sed -i 's/#SystemMaxUse=/SystemMaxUse=100M/' /etc/systemd/journald.conf
sudo sed -i 's/#SystemMaxFiles=100/SystemMaxFiles=7/g' /etc/systemd/journald.conf
sudo journalctl --rotate
sudo rm -v /var/log/*.log* /var/log/syslog*
sudo sed -i 's/rotate 7/rotate 1/g' /etc/logrotate.d/rsyslog
sudo sed -i 's/rotate 4/rotate 1/g' /etc/logrotate.d/rsyslog
sudo sed -i 's/weekly/daily/g' /etc/logrotate.d/rsyslog
sudo sed -i 's/rotate 4/rotate 1/g' /etc/logrotate.conf
sudo sed -i 's/weekly/daily/g' /etc/logrotate.conf
sudo ufw logging off
sudo sed -i 's/#SystemMaxUse=/SystemMaxUse=100M/' /etc/systemd/journald.conf
sudo tee /etc/modprobe.d/snd-hda-intel.conf <<<'options snd-hda-intel power_save=0' 
sudo swapoff /swapfile
sudo cp -v /usr/share/systemd/tmp.mount /etc/systemd/system/
sudo systemctl enable tmp.mount
echo "blacklist btusb" | sudo tee /etc/modprobe.d/blacklist-bluetooth.conf
echo "blacklist hci_uart" | sudo tee /etc/modprobe.d/blacklist-bluetooth.conf
sudo apt install gedit abiword chromium-browser
sudo apt update
sudo apt upgrade
sudo apt clean
sudo apt autoclean
sudo apt autoremove
