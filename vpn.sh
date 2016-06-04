#!/bin/bash

# Start vpn
function up {
	local keyName=`ls|grep \.ovpn`
	if [ $keyName ]; then
		down
		echo 'VPN up success'
		nohup openvpn $keyName >/dev/null 2>/dev/null &
	else
		echo 'VPN Error:'
		echo 'Файл ключа (.ovpn) не найден'
	fi
}

# Down vpn
function down {
	local idVpn=$(getIdVpn)
	if [ $idVpn ]; then
		echo 'VPN down success'
		nohup kill -KILL  $idVpn >/dev/null 2>/dev/null &
	fi
}

# Get id ps vpn
function getIdVpn {
	local idVpn=`ps -e | grep -i openvpn | awk {'print $1'}`
	echo $idVpn
}

# Get status vpn
function status {
	local idVpn=$(getIdVpn)
	if [ $idVpn ]; then
		echo 'VPN status Up';
	else
		echo 'VPN status Down'
	fi
}

if [ $1 ]; then
	if [ $1 = 'up' ] || [ $1 = '-u' ]; then
		up
	elif [ $1 = 'down' ] || [ $1 = '-d' ]; then
		down
	elif [ $1 = 'status' ] || [ $1 = '-s' ]; then
		status
	fi
else
	up
fi