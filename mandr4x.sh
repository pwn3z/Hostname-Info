#!/bin/bash

# Coded by Mandr4x #

echo -e "Wordlist with hosts/ips: "; read host

for i in `cat $host`
do
request=$(curl -s -k https://check-host.net/ip-info?host=$i |grep -A 2 "Organization" |head -n2 |awk -F '<td>' '{print $2}' |awk -F '</td>' '{print $1}' |awk -F 'Organization' '{print $1}' |awk 'NF>0')
request2=$(curl -s -k https://check-host.net/ip-info?host=$i |grep -A 3 "Country" |head -n4 |awk -F '<td>' '{print $1}' |awk 'NF>0' |awk -F '<strong>' '{print $2}' |awk 'NF>0' |awk -F '</strong>' '{print $1}')
request3=$(curl -s -k https://check-host.net/ip-info?host=$i |grep -A 3 "Region" |head -n2 |awk -F '<td>' '{print $2}' |awk -F '</td>' '{print $1}' |awk -F 'Region' '{print $1}' |awk 'NF>0')
request4=$(curl -s -k https://check-host.net/ip-info?host=$i |grep -A 3 "Host name" |head -n2 |awk -F '<td>' '{print $2}' |awk -F '</td>' '{print $1}' |awk -F 'Host name' '{print $1}' |awk 'NF>0')
echo -e "\033[01;37m$i\033[01;37m\033[01;31m - \033[01;31m\033[01;33mProvider: $request\033[01;33m\033[01;31m | \033[01;31m\033[01;32mCountry: $request2\033[01;32m \033[01;31m|\033[01;31m \033[01;34mState:$request3\033[01;34m\033[01;31m |\033[01;31m \033[01;35mDNS: $request4\033[01;35m" 
echo -e "$i - Provider: $request | Country: $request2 | State:$request3 | DNS: $request4" >> isp.txt
done
