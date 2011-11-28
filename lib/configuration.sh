#!/bin/sh

# TODO use a cd-to-script-directory shim here.

# Directories
export LEASH_DIRECTORY="$(pwd)"
export SERVER_DIRECTORY="${LEASH_DIRECTORY}/server"
export PROFILE_DIRECTORY="${SERVER_DIRECTORY}/profiles/"
export RUN_DIRECTORY="${SERVER_DIRECTORY}/run"

# Pidfiles
export PROCER_PIDFILE="${RUN_DIRECTORY}/procer.pid"

# Other environment setup
export PATH="${LEASH_DIRECTORY}/usr/bin:$PATH"