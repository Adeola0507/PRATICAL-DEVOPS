#!/bin/bash
echo "#######Disk Usage ######"
df -h #shows disk space in human-readable format (GB/MB instead of raw numbers)

echo "######## Memory Usage ######"
systeminfo | grep -i "memory" #shows RAM usage,note: this command is for Windows, for Linux you can use free -h

echo "######## CPU Usage ######"
ps

echo "#######Disk Space Warning Check#####"
USAGE=$(df -h / | tail -1 | awk '{print $6}' | sed 's/%//')

if [ "$USAGE" -gt 80 ]; then
    echo "WARNING: Disk usage is above 80%! Currently at $USAGE%"
else
    echo "Disk usage OK: $USAGE%"
fi

#############
########df -h / | tail -1 — gets just the line for your root disk
########awk '{print $6}' — grabs the 6th column (the percentage, like 33%)
#####3##sed 's/%//' — removes the % symbol so we're left with just a number
#########if [ "$USAGE" -gt 80 ] — checks if that number is greater than 80
#########Prints a warning if true, otherwise says it's fine

####### chmod +x healthcheck.sh #makes the script executable
######## ./healthcheck.sh #runs the script