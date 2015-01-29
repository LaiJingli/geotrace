#!/bin/bash
echo traceroute to [$1] from localhost
ip=$1
echo

####如果是linux系统请将mac部分注释掉，反之亦然

####for linux
####显示详细地理位置信息
#echo ----显示详细地理位置信息----
#mtr --n --report $ip|grep -v Snt|awk '{printf "%-18s  %-10s",  NR ") "$1,"  Delay["$4"s]   ";system("whois "$1"|grep -e netname -e descr|cut -c17-");printf "\n"}'
####显示简略地理位置信息
#echo ----示简略地理位置信息---
#mtr --n --report $ip|grep -v Snt|awk '{printf "%-18s  %-10s",  NR ") "$1,"  Delay["$4"s]   ";system("whois "$1"|grep descr|head -n1|cut -c17-");printf "\n"}'


###for mac
####显示详细地理位置信息
echo ----显示详细地理位置信息----
mtr --n --report $ip|grep -vE "Snt|Start"|awk '{printf "%-18s  %-10s",  NR ") "$2, " Dleay["$6"]  ";system("whois "$2"|grep -e netname -e descr|cut -c17-");printf "\n"}'
####显示简略地理位置信息
echo ----示简略地理位置信息---
mtr --n --report $ip|grep -vE "Snt|Start"|awk '{printf "%-18s  %-10s",  NR ") "$2, " Dleay["$6"]  ";system("whois "$2"|grep descr|head -n1|cut -c17-");printf "\n"}'
