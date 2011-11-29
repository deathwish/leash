#!/bin/sh

# Directories
export LEASH_DIRECTORY="$(pwd)"
export PREFIX_DIRECTORY="${LEASH_DIRECTORY}/usr"
export SERVER_DIRECTORY="${LEASH_DIRECTORY}/server"
export PROFILE_DIRECTORY="${SERVER_DIRECTORY}/profiles"
export RUN_DIRECTORY="${SERVER_DIRECTORY}/run"
export LOG_DIRECTORY="${SERVER_DIRECTORY}/logs"
export TMP_DIRECTORY="${SERVER_DIRECTORY}/tmp"

# Logfiles
export LEASH_LOG="${LOG_DIRECTORY}/leash.log"

# Pidfiles
export PROCER_PIDFILE="${RUN_DIRECTORY}/procer.pid"

# Other environment setup
export PATH="${PREFIX_DIRECTORY}/bin:$PATH"