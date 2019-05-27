#!/usr/bin/bash

isRoot=$(whoami)

if [ $isRoot != 'root' ]; then
	echo 'You Must Be root To Run This Command . . .'
	exit 0
fi	

OPENSSL_ENABLE_MD5_VERIFY=1 openvpn --config zattoo-zrh.ovpn --ca ca.crt --tls-cipher DEFAULT:@SECLEVEL=0
