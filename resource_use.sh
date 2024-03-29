#!/bin/bash
printf "%-20% %-20% %-20% %-20 %-20\n" IP, CPU, MEMORY, DISK
for ip in `cat list`
do
	CPU= ssh root@$ip top -bn1 | grep load | awk '{printf "CPU load: %.2f", $(NF-2)}'
	MEM= ssh -o ConnectTimeout=3 root@$ip free -m | awk 'NR==2{printf "Memory Usage: %s/%sMB (%s.2f%%)", $3,$2,$3*100/2}'
	SSDDISK= ssh -o ConnectTimeout=3 root@$ip df -h | awk '$NF=="/"{printf "Disk Usage: %.0fGB/%dGB (%s)", $3,$2,$5}'
        printf %-20s %-20s %-20s %-20s %-20s\n" "$ip",   "$CPU",   "$MEM",  "$SSDDISK"
done
