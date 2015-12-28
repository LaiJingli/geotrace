#!/bin/bash
###geotrace是根据mtr（my trace route）的报告内容结合whois来直观显示traceroute过程中经过的路由跳数、ip、平均延迟、运营商、地理位置信息等内容，在做机房选址的时候会给带来极大的帮助。
###laijingli2006@gmail.com 

####自动适配是linux系统还是mac系统
os_type=`uname`
#ip_geo_method=whois
ip_geo_method=qqwry
#ip_geo_method=taobao

mtr_report=/tmp/.mtr_report

echo 开始traceroute: `date`
echo traceroute to [$1] from localhost
ip=$1
echo

mtr --n --report $ip >$mtr_report
if [ $ip_geo_method = qqwry ];then
	###使用本地的纯真ip库进行查询
	cat $mtr_report|grep -vE "Snt|Start"|awk '{printf NR " "$2" ";system("[ `echo "$2"|grep -E ^[1-9] ` ] &&  python query_ip_geo.py "$2"|cut -d\" \" -f2| awk \x27 {printf \"%s \",$1}\x27");print "Loss["$3"] Avg_Delay["$6"]"}'|column -t
elif [ $ip_geo_method = whois ];then	
	if [ $os_type = Linux ];then
		####for linux
		####显示简略地理位置信息
		echo ----显示简略地理位置信息---
		cat $mtr_report|grep -v Snt|awk '{printf "%-18s  %-10s",  NR ") "$1,"  Delay["$4"s]   ";system("whois "$1"|grep descr|head -n1|cut -c17-");printf "\n"}'

	elif [ $os_type = Darwin ];then
		###for mac
		####显示简略地理位置信息
		echo ----显示简略地理位置信息---
		cat $mtr_report|grep -vE "Snt|Start"|awk '{printf "%-18s  %-10s",  NR ") "$2, " Dleay["$6"]  ";system("whois "$2"|grep descr|head -n1|cut -c17-");printf "\n"}'

	else
		echo $0只支持linux和macos系统
	fi
fi

