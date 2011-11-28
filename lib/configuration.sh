#!/bin/sh

# Directories
export LEASH_DIRECTORY="$(pwd)"
export SERVER_DIRECTORY="${LEASH_DIRECTORY}/server"
export PROFILE_DIRECTORY="${SERVER_DIRECTORY}/profiles/"
export RUN_DIRECTORY="${SERVER_DIRECTORY}/run"
export LOG_DIRECTORY="${SERVER_DIRECTORY}/logs"

# Logfiles
export LEASH_LOGFILE="${LOG_DIRECTORY}/leash.log"

# Pidfiles
export PROCER_PIDFILE="${RUN_DIRECTORY}/procer.pid"

# Other environment setup
export PATH="${LEASH_DIRECTORY}/usr/bin:$PATH"