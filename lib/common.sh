#!/bin/sh

#
# Log the provided message to the terminal and to a running logfile
# Example: log "./build.log" "This is a message"
#
log() {
	 LOGFILE=$1
	 MESSAGE=$2
	 
	 echo $MESSAGE
	 echo $MESSAGE >> $LOGFILE
}

#
# Log the output of the given command to the given logfile and exit if it does not succeed.
# example checked_command "./build.log" make install
#
checked_command() {
	 LOGFILE=$1
	 shift 1

	 $* 1>> $LOGFILE 2>&1
	 if [ $? != 0 ];
	 then
		  log $LOGFILE "Command $* exited with status $?"
		  exit 1
	 fi
}