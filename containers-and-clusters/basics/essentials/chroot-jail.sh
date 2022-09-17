# chroot jail where you can only use ls and bash commands
# jail = arkham asylum
# inmates = harley quinn (more users can be added later)

ssh $USER@$IP -i $KEY.pem
sudo su
yum update -y

mkdir /home/arkham
mkdir /home/arkham{bin,lin64}
groupadd inmates
useradd -g inmates quinn
# groups quinn

cd /home/arkham/bin
cp /usr/bin/ls .
cp /usr/bin/bash .

# ldd /bin/bash
# ldd /bin/ls
cp -v /lib64/$LS_LIBS /lib64/$BASH_LIBS /bin/arkham/lib64
# copy all essential libraries for ls and bash and put them in arkham's lib64 dir

touch escape.txt
echo "All you need to do is open the door!" > escape.txt

# CHROOT INTO ARKHAM
chroot /home/arkham/ /bin/bash
# you can only use ls and bash here. no other commands should work.
# exit from chroot using the exit command.

# CREATE A CHROOT SSH ENVIRONMENT FOR INMATES
# vim /etc/ssh/sshd_config

# add below script to the bottom of the file
# Match group inmates
# 	ChrootDirectory /home/arkham
# 	X11Forwarding no
# 	AllowTcpForwarding no

systemctl restart sshd
passwd quinn
ssh quinn@$IP
# only ls and bash should work for user quinn.
