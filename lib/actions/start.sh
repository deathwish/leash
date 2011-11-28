#!/bin/sh

log $LEASH_LOGFILE "Starting leash..."
checked_command $LEASH_LOGFILE procer $PROFILE_DIRECTORY $PROCER_PIDFILE
log $LEASH_LOGFILE "Done."
