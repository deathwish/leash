#!/bin/sh

source "lib/configuration.sh"

kill -- -`cat $PROCER_PIDFILE`