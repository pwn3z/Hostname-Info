#!/bin/bash

# Coded by Mandr4x #

cat host | parallel -j10 'isp=$(timeout 3 curl -ks "https://check-host.net/ip-info?host={}" |grep -A 2 "ISP" |head -n2 |cut -d ">" -f2 |cut -d "<" -f1 |sed "s/ISP//g" |sed "/^$/d")
organization=$(timeout 3 curl -ks "https://check-host.net/ip-info?host={}" |grep -A 2 "Organization" |head -n2 |cut -d ">" -f2 |cut -d "<" -f1 |sed "s/Organization//g" |sed "/^$/d")
country=$(timeout 3 curl -ks "https://check-host.net/ip-info?host={}" |grep -A 4 "Country" |head -n4 |cut -d ">" -f2 |cut -d "<" -f1 |sed "s/Country//g" |sed "/^$/d")
hostname=$(timeout 3 curl -ks "https://check-host.net/ip-info?host={}" |grep -A 2 "Host name" |head -n2 |cut -d ">" -f2 |cut -d "<" -f1 |sed "s/Host name//g" |sed "/^$/d")
if [ "$country" = "Brazil" ]
then
echo -e "{}" >> brasil
else
echo -e "{} | ISP: $isp | Provider: $organization | Country: $country | Hostname: $hostname"
echo -e "{} | ISP: $isp | Provider: $organization | Country: $country | Hostname: $hostname" >> target_info
fi'
