echo "all variables : $@"

echo "Number of Variables : $#  "

echo "Script Name : $0"

echo "Current Working Directory : $PWD"

echo "Home Directory of current user: $HOME"

echo " Which user is running the script : $USER"

echo " Hostname : $HOSTNAME"

echo "Process ID of the current process :$$"

sleep 60 &

echo " Process ID of the Background COMMAND :$!"