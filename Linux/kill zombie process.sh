# Check if the system process table reports zombie processes
top

# List all the zombie processes
ps aux | egrep "Z|defunct"

# Use the process PID to find the ID of its parent process
ps -o ppid= -p <process_id>

# Verify whether the parent process ID exists
ps -e | grep <process_id>

# Use the kill command with the -SIGKILL flag to kill it
sudo kill -SIGKILL <process_id>
