#!/bin/bash

COURSE="Devops from current Script"

echo "Before calling other scripts, course : $COURSE"

echo " Process ID of the  current shell script   : $$"

#./14-other-scripts.sh

source ./14-other-script.sh

echo "After calling other script , course :  $COURSE"

echo "Process ID of the other script : $$"

