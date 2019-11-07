if [[ $# -lt 2 ]]; then
	echo "Missing arguments"
	echo "Usage:"
	echo "\t$0 <node_number> <total_pi_nodes>"
	exit 1
fi

node_number=$1
total_pi_nodes=$2

#set hostname
hostname=$(printf "pi%02d" $node_number)
sed "/127.0.0.1/s/$/ $hostname/" /etc/hosts > /etc/hosts

#add all nodes /etc/hosts
for i in `seq 11 $(expr 10 + $total_pi_nodes)`; do
	printf "192.168.0.$i    %02d\n" $i >> /etc/hosts
done



#configure ethernet and set static ip base on node number
printf "DEVICE=eth0
BOOTPROTO=static
IPADDR=192.168.0.%d
NETMASK=255.255.255.0
GATEWAY=192.168.0.1
DNS1=192.168.0.1
DNS2=1.1.1.1\n" $(expr 10 + $node_number) > /etc/sysconfig/network-scripts/ifcfg-eth0

# Restart network services
systemctl restart network