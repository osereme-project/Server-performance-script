# Project
 
Prints a label for load average.
1. uptime | awk -F'load average:' '{print $2}':
   Displays load averages for 1, 5, and 15 minutes by extracting values from the uptime command output.
	
2. echo -e "\nLogged In Users:" :
   Prints a label for displaying logged-in users.
	
3. who:
   Displays currently logged-in users and session details.

4. echo -e "\nFailed Login Attempts (Last 5):":
   Prints a label for failed login attempts.
	
5. grep "Failed password" /var/log/auth.log | tail -n 5:
    Retrieves the last 5 failed login attempts from the authentication log (/var/log/auth.log).

6. echo -e "\nTotal CPU Usage:":
    Prints a label for CPU usage.

7. top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"% CPU used"}':
    Retrieves and calculates the total CPU usage by getting idle time from top output and subtracting it from 100%.
	
8. echo -e "\nTotal Memory Usage:" :
    Prints a label for memory usage.
	
9. free -m | awk 'NR==2{printf "Used: %sMB / Total: %sMB (%.2f%%)\n", $3, $2, $3*100/$2 }':
    Calculates and displays memory usage by extracting used and total memory values and calculating the percentage used.
	
10. echo -e "\nTotal Disk Usage:" :
    Prints a label for disk usage.
	
11. df -h | awk '$NF=="/"{printf "Used: %dGB / Total: %dGB (%s)\n", $3, $2, $5}':
    Retrieves disk usage for the root (/) partition, showing used, total space, and usage percentage.
	
12. echo -e "\nTop 5 Processes by CPU Usage:":
    Prints a label for processes sorted by CPU usage.
	
13. ps aux --sort=-%cpu | head -n 6 | awk '{print $1, $2, $3, $4, $11}':
    Lists the top 5 processes by CPU usage using ps, sorted in descending order by CPU percentage, and displays columns for user, PID, CPU%, MEM%, and command name.

14. echo -e "\nTop 5 Processes by Memory Usage:":
    Prints a label for processes sorted by memory usage.
	
15. ps aux --sort=-%mem | head -n 6 | awk '{print $1, $2, $3, $4, $11}':
    Lists the top 5 processes by memory usage in descending order by memory percentage, displaying columns for user, PID, CPU%, MEM%, and command name.


Running the Script

To make this script executable and run it on a Linux server:
chmod +x server-stats.sh
./server-stats.sh

Explanation of Stretch Goal Metrics

* Operating System Version: Shows the OS version by reading from /etc/os-release.
* Uptime: Displays how long the server has been running.
* Load Average: Shows load average over 1, 5, and 15 minutes, indicating system load.
* Logged In Users: Lists currently logged-in users, which can help in auditing sessions.
* Failed Login Attempts: Displays the last five failed login attempts, useful for security monitoring.

This script provides a basic and extended set of server performance metrics in a concise format.
