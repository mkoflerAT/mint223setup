#!/bin/bash
# Author: Markus Kofler
# Date: 2020-08-05
# Purpose: Treat time as local time like Win10
# Reference: https://techlr.de/dual-boot-windows-10-und-linux-falsche-uhrzeit

echo 'Time before change:'
timedatectl
timedatectl set-local-rtc 1 --adjust-system-clock
echo 'Time after change (now):
