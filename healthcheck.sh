#!/bin/bash

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

    CPU=$(top -bn1 | awk '/Cpu\(s\)/ {print 100 - $8}' | cut -d. -f1)

    if [ "$CPU" -gt 80 ]; then
        echo "WARNING: CPU usage is above 80%"
    else
        echo "CPU usage is normal"
    fi
}

system_info
cpu_check
memory_check
disk_check
threshold_check





