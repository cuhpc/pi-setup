root_pw=centos
num_pi_nodes=8
node_number=9


#set hostname
hostname=$(printf "pi%02d" $node_number)
sed "/127.0.0.1/s/$/ $hostname/" /etc/hosts > /etc/hosts

#add all nodes /etc/hosts
for i in `seq 11 $(expr 10 + $num_pi_nodes)`; do
	printf "192.168.0.$i    %02d\n" $i >> /etc/hosts
done



#edit /etc/sysconfig/network-scripts/ifcfg-eth0  to contain the following (change IP addr)
#DEVICE=eth0
#BOOTPROTO=static
#IPADDR=192.168.0.11
#NETMASK=255.255.255.0
#GATEWAY=192.168.0.1
#DNS1=192.168.0.1
#DNS2=1.1.1.1

# Restart network services
systemctl restart network

#set root password
echo $root_pw | passwd --stdin

