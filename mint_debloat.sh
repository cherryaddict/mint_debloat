#!/bin/bash
flatpak remote-delete flathub
sudo apt purge simple-scan* firefox* libreoffice* hexchat* hypnotix* xviewer* xreader* thingy* onboard* drawing* pix* rhythmbox* thunderbird* warpinator* mintwelcome* blueman* mintbackup* gnome-disk-utility* baobab* bulky* sticky* system-config-printer* timeshift* *flatpak* fonts-beng fonts-beng-extra fonts-deva fonts-deva-extra fonts-gargi fonts-gubbi fonts-gujr fonts-gujr-extra fonts-guru fonts-guru-extra fonts-indic fonts-kacst fonts-kacst-one fonts-kalapi fonts-khmeros-core fonts-knda fonts-lao fonts-lklug-sinhala fonts-lohit-beng-assamese fonts-lohit-beng-bengali fonts-lohit-deva fonts-lohit-gujr fonts-lohit-guru fonts-lohit-knda fonts-lohit-mlym fonts-lohit-orya fonts-lohit-taml fonts-lohit-taml-classical fonts-lohit-telu fonts-mlym fonts-nakula fonts-navilu fonts-noto-cjk fonts-orya fonts-orya-extra fonts-pagul fonts-sahadeva fonts-samyak-deva fonts-samyak-gujr fonts-samyak-mlym fonts-samyak-taml fonts-sarai fonts-sil-abyssinica fonts-sil-padauk fonts-smc fonts-smc-anjalioldlipi fonts-smc-chilanka fonts-smc-dyuthi fonts-smc-gayathri fonts-smc-karumbi fonts-smc-keraleeyam fonts-smc-manjari fonts-smc-meera fonts-smc-rachana fonts-smc-raghumalayalamsans fonts-smc-suruma fonts-smc-uroob fonts-taml fonts-telu fonts-telu-extra fonts-teluguvijayam fonts-thai-tlwg fonts-tibetan-machine fonts-tlwg-garuda fonts-tlwg-garuda-ttf fonts-tlwg-kinnari fonts-tlwg-kinnari-ttf fonts-tlwg-laksaman fonts-tlwg-laksaman-ttf fonts-tlwg-loma fonts-tlwg-loma-ttf fonts-tlwg-mono fonts-tlwg-mono-ttf fonts-tlwg-norasi fonts-tlwg-norasi-ttf fonts-tlwg-purisa fonts-tlwg-purisa-ttf fonts-tlwg-sawasdee fonts-tlwg-sawasdee-ttf fonts-tlwg-typewriter fonts-tlwg-typewriter-ttf fonts-tlwg-typist fonts-tlwg-typist-ttf fonts-tlwg-typo fonts-tlwg-typo-ttf fonts-tlwg-umpush fonts-tlwg-umpush-ttf fonts-tlwg-waree fonts-tlwg-waree-ttf gnome-system-monitor
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
sudo apt install gedit abiword
