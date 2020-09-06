#!/bin/sh

SRC=./GeoIPCountryWhois.csv

for BANIP in `egrep "China" $SRC | cut -d, -f1,2 | sed -e 's/"//g' | sed -e 's/,/-/g'`
    do
        /sbin/iptables -A INPUT -p all -m iprange --src-range $BANIP -j DROP
    done
