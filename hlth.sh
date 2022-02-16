#!/bin/bash

#  This script checks if available disk space is less than 3GB and Memory is less than 512MB.

disk_free=$(df -m / | grep 'rootfs' | awk '{print $4}')
mem_free=$(free -m | grep 'Mem' | awk '{print $4}')

#echo $disk_free
#echo $mem_free

#if both low
if [ $disk_free -lt 3072 ] && [ $mem_free -lt 5120 ] 
then
	echo "Resource critical"
	exit 0
fi

#if disk low
if [ $disk_free -lt 3072 ] 
then
	echo "Disk low"
	exit 0
fi

#if mem low
if [ $mem_free -lt 512 ] 
then
	echo "Memory low"
	exit 0
fi

#if everyting is good
echo "Available resources are fine."
