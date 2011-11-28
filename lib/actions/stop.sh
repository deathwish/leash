#!/bin/sh

log $LEASH_LOGFILE "Stopping leash..."
checked_command $LEASH_LOGFILE kill -- -`cat $PROCER_PIDFILE`
log $LEASH_LOGFILE "Done."