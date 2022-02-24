#cloud or local host is starting init.

#set hostname. argument is "cloud" or "local"
hostname(){
	currentName=$(hostname)
	resName=""
	if [ $1 == "cloud" ]
	then
		secondName=$(dig www.pwall.icu|grep ^www.pwall.icu|awk '{print $5}'|sed 's/\./ /g'|awk '{print $3,$4}'|sed 's/ /-/')
		resName="cloud-${secondName}"
	else if [ $1 == "local" ]
	then 
		secondName="c7model"
		resName=${secondName}
	else
		echo "error"
	fi
	echo "${resName}" > /etc/hostname
	debug "hostname" "old:${currentName}" "new:${resName}"
}
