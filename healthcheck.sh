#!/bin/bash


GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'


system_info() {
    echo "==== Linux Server Health Check ===="

    echo "Hostname:"
    hostname

    echo "Uptime:"
    uptime

    echo "CPU:"
    nproc

    echo "Memory:"
    free -h

    echo "Disk:"
    df -h
}

cpu_check() {
    echo "===== CPU Information ====="

    echo "Number of CPUs:"
    nproc

    echo "CPU Load:"
    uptime
}

memory_check() {
    echo "===== Memory Information ====="

    echo "Memory Usage:"
    free -h
}

disk_check() {
    echo "===== Disk Information ====="

    echo "Disk Monitoring:"
    df -h
}
threshold_check() {
    echo "===== Threshold Check ====="

    DISK=$(df / | awk 'NR==2 {gsub("%","",$5); print $5}')

    if [ "$DISK" -gt 80 ]; then
        echo -e "${RED}WARNING: Disk usage is above 80%${NC}"
    else
        echo -e "${GREEN}Disk usage is normal${NC}"
    fi

    MEMORY=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

    if [ "$MEMORY" -gt 80 ]; then
        echo -e "${RED}WARNING: Memory usage is above 80%${NC}"
    else
        echo -e "${GREEN}Memory usage is normal${NC}"
    fi

    CPU=$(mpstat 1 1 | awk '/Average:/ && $2 == "all" {printf "%.0f", 100 - $NF}')

    if [ "$CPU" -gt 80 ]; then
        echo -e "${RED}WARNING: CPU usage is above 80%${NC}"
    else
        echo -e "${GREEN}CPU usage is normal${NC}"
    fi
}
system_info
cpu_check
memory_check
disk_check
threshold_check





