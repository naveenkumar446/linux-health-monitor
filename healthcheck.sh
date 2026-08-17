#!/bin/bash



echo "==== linux server health check"

echo "hostname:"
hostname

echo "uptime:"
uptime

echo "cpu:"
nproc

echo "memory:"
free -h

echo "disk:"
df -h

echo "===== cpu information ===="

echo "no of cpus:"
nproc

echo "cpu load:"
uptime

echo "===== memory information ====="

echo "memory usage"
free -h

echo "===== disk information ===== "

echo "disk monitoring"
df -h


echo "===== Threshold Check ====="

DISK=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

if [ "$DISK" -gt 80 ]; then
    echo "WARNING: Disk usage is above 80%"
else
    echo "Disk usage is normal"
fi

MEMORY=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

if [ "$MEMORY" -gt 80 ]; then
    echo "WARNING: Memory usage is above 80%"
else
    echo "Memory usage is normal"
fi










