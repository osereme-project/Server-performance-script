#!/bin/bash

# Display OS version
echo "Operating System Version:"
cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"'

# Display uptime
echo -e "\nServer Uptime:"
uptime -p

# Display load average
echo -e "\nLoad Average (1, 5, 15 min):"
uptime | awk -F'load average:' '{print $2}'

# Display logged in users
echo -e "\nLogged In Users:"
who

# Display failed login attempts (last 5)
echo -e "\nFailed Login Attempts (Last 5):"
grep "Failed password" /var/log/auth.log | tail -n 5

# Get total CPU usage
echo -e "\nTotal CPU Usage:"
top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"% CPU used"}'

# Get total memory usage (Free vs Used including percentage)
echo -e "\nTotal Memory Usage:"
free -m | awk 'NR==2{printf "Used: %sMB / Total: %sMB (%.2f%%)\n", $3, $2, $3*100/$2 }'

# Get total disk usage (Free vs Used including percentage)
echo -e "\nTotal Disk Usage:"
df -h | awk '$NF=="/"{printf "Used: %dGB / Total: %dGB (%s)\n", $3, $2, $5}'

# Top 5 processes by CPU usage
echo -e "\nTop 5 Processes by CPU Usage:"
ps aux --sort=-%cpu | head -n 6 | awk '{print $1, $2, $3, $4, $11}'

# Top 5 processes by memory usage
echo -e "\nTop 5 Processes by Memory Usage:"
ps aux --sort=-%mem | head -n 6 | awk '{print $1, $2, $3, $4, $11}'
