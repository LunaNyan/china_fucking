#!/bin/sh

SRC=./GeoIPCountryWhois.csv

ipset -q flush ipsum_china
ipset -q create ipsum_china hash:net

for BANIP in `egrep "China" $SRC | cut -d, -f1,2 | sed -e 's/"//g' | sed -e 's/,/-/g'`
    do
        ipset add ipsum_china $BANIP
    done

iptables -I INPUT -m set --match-set ipsum_china src -j DROP
