#!/bin/sh

log $LEASH_LOG "Stopping leash..."
checked_command $LEASH_LOG kill -- -`cat $PROCER_PIDFILE`
log $LEASH_LOG "Done."