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



