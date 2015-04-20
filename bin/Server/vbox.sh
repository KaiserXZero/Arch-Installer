#! /bin/sh
cd ~/Documents/VirtualBox/Machines
ls -a command &>/dev/null
shopt -s dotglob command &>/dev/null
shopt -s nullglob command &>/dev/null
array=(*) 
for dir in "${array[@]}"; do echo $dir; done 
for dir in *; do echo $dir; done
PS3="which Virual Machine do you want? "
echo "There are ${#array[@]} Virtual Machines ";
select dir in "${array[@]}"; 
do VBoxManage startvm ${dir} --type headless;
sleep 10
break;
done
