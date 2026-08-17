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



