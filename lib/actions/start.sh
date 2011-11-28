#!/bin/sh

log $LEASH_LOG "Starting leash..."
checked_command $LEASH_LOG procer $PROFILE_DIRECTORY $PROCER_PIDFILE
log $LEASH_LOG "Done."
