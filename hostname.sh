#!/bin/bash
printf "%-16s %-20s\n" IP HOSTNAME
for i in $(seq 1 254)
do
	IP=10.X.X.$i
	HOST=`ssh -oStrictHostKeyChecking=no 10.X.X.$i "hosrname"`
	printf "%-16s %-20s\n" "$IP" "$HOST"
done
