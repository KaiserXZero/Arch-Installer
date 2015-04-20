#!/bin/bash

source var.var

source packages.var
gen_build ()
{
  sudo bash multilib.sh
  sudo bash reflector_setup.sh
  sudo bash reflector.sh
  sudo pacman -Syyu
  sudo pacman -S $common + " " + $general
  wget https://aur.archlinux.org/packages/co/cower/cower.tar.gz -P /home/$user/Downloads
  wget https://aur.archlinux.org/packages/pa/pacaur/pacaur.tar.gz -P /home/$user/Downloads
  tar -xzvf /home/$user/Downloads/cower.tar.gz -C /home/$user/Downloads/
  cd /home/$user/Downloads/cower
  makepkg -s
  cower=(/home/$user/Downloads/cower/*)
  for (( x=0; x<${#cower[@]}; x=x+1 ))
    do
      echo "$x: ${cower[$x]}"
    done
  read cower_val
  sudo pacman -U ${cower[$cower_val]}
  tar -xzvf /home/$user/Downloads/pacaur.tar.gz -C /home/$user/Downloads/
  cd /home/$user/Downloads/pacaur
  makepkg -s
  pacaur=(/home/$user/Downloads/pacaur/*)
  for (( x=0; x<${#pacaur[@]}; x=x+1 ))
    do
      echo "$x: ${pacaur[$x]}"
    done
  read pacaur_val
  sudo pacman -U ${pacaur[$pacaur_val]}
  cd ~
  pacaur -Syyu
  pacaur -S $aur
# Sets up fish
  chsh -s /usr/bin/fish
  echo 'set fish_greeting ""' > /home/$user/.config/fish/config.fish
}

##### MAIN INSTALLER ########################
echo "What Type of install are you preforming?"
echo "1: Server"
echo "2: Desktop"
echo "3: Laptop"
echo "4: Container"
read computer

case $computer in

[1]) #*******Server***************************************************

##### Mirrors and Apps ###########################
sudo bash networks.sh
sudo bash multilib.sh
sudo bash reflector_setup.sh
sudo bash reflector.sh
sudo pacman -Syyu
sudo pacman -S $general + ' ' + $server
bash makedir.sh
###########################################

##### Splash Screen #############################
bash splash.sh
###########################################

##### Cron Job ################################
sudo bash cron.sh
###########################################

##### SSH ###################################
sudo systemctl start sshd
sudo systemctl enable sshd.service
sudo bash ssh_setup.sh
sudo bash stunnel_server_setup.sh
###########################################

#### Sets up fish ###############################
  chsh -s /usr/bin/fish
  echo 'set fish_greeting ""' > /home/$user/.config/fish/config.fish
###########################################

##### VNCSERVER ##############################
#bash vncserver_setup.sh
###########################################

##### LAMP SERVER #############################
#bash gen_public_html.sh
#sudo systemctl enable httpd
#sudo systemctl start httpd
#sudo bash gen_ssl.sh
#sudo bash enable_ssl.sh
#sudo bash enable_php.sh
#sudo bash enable_sql.sh
#sudo bash setup_phpmyadmin.sh
###########################################

##### VIRTUALBOX #############################
#sudo bash vbox_setup.sh
#sudo bash phpvbox.sh
###########################################

##### DOCKER ################################
#sudo systemctl enable docker
#sudo systemctl start docker
###########################################

#********************************************************************
;;

[2]) #*******Desktop*************************************************
gen_build

sudo bash ssh_machine.sh
sudo bash stunnel.sh
#********************************************************************
;;

[3]) #*******Laptop**************************************************

gen_build

##### Power Saving #############################
sudo bash power_saving.sh
################################################

##### TLP ######################################
sudo pacman -Sy tlp tp_smapi acpid ethtool iw lsb-release smartmontools
systemctl enable tlp
systemctl enable tlp-sleep
sudo bash tlp.sh
################################################

##### SSH########################################
sudo bash ssh_machine.sh
sudo bash stunnel.sh
################################################

#********************************************************************
;;

*) #Exit
      exit
;;

esac
