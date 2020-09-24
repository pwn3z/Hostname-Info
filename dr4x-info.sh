#!/bin/bash

# Coded by Mandr4x #

clear
echo -e "Wordlist: "; read host

cat $host |parallel -j50 'a=$(curl -s -k https://check-host.net/ip-info?host={} |grep -A 2 "Organization" |head -n2 |cut -d ">" -f2 |cut -d "<" -f1 |xargs|sed "s/Organization//g")
request2=$(curl -s -k https://check-host.net/ip-info?host={} |grep -A 3 "Country" |head -n4 |cut -d ">" -f2 |cut -d "<" -f1 |xargs|sed "s/Country //g")
request3=$(curl -s -k https://check-host.net/ip-info?host={} |grep -A 3 "Host name" |head -n2 |cut -d ">" -f2 |cut -d "<" -f1 |xargs|sed "s/Host name //g")
echo -e "\033[01;37m{}\033[01;37m\033[01;31m - \033[01;31m\033[01;33mProvider:$a\033[01;33m\033[01;31m | \033[01;31m\033[01;32mCountry: $request2\033[01;32m \033[01;31m|\033[01;31m \033[01;35mDNS: $request3\033[01;35m"'
echo -e "{} - Provider:$a | Country: $request2 | DNS: $request3"
