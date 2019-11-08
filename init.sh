root_pw=centos

action(){
	if [[ dry_run -eq 0 ]] ; then
		$("$@")
	fi
}


#set root password
echo $root_pw | passwd --stdin

#expand filesystem
action sudo rootfs-expand

#expand partition
