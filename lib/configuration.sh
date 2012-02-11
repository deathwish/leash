#!/bin/bash

# Directories
export LEASH_DIRECTORY="$(pwd)"
export PREFIX_DIRECTORY="${LEASH_DIRECTORY}/usr"
export TMPDIR="${LEASH_DIRECTORY}/tmp"
if [ -n "${LEASH_CONFIG_PATH}" ]
then
	export SERVER_DIRECTORY=$(readlink -f $LEASH_CONFIG_PATH)
else
	export SERVER_DIRECTORY="${LEASH_DIRECTORY}/server"	
fi
export PROFILE_DIRECTORY="${SERVER_DIRECTORY}/profiles"
export RUN_DIRECTORY="${SERVER_DIRECTORY}/run"
export LOG_DIRECTORY="${SERVER_DIRECTORY}/logs"
export TMP_DIRECTORY="${SERVER_DIRECTORY}/tmp"
export DATABASE_DIRECTORY="${SERVER_DIRECTORY}/db"

# Logfiles
export LEASH_LOG="${LOG_DIRECTORY}/leash.log"
export BUILD_LOG="${LEASH_DIRECTORY}/build.log"

# Pidfiles
export PROCER_PIDFILE="${RUN_DIRECTORY}/procer.pid"

# Databases
export CONFIG_DATABASE="${DATABASE_DIRECTORY}/config.sqlite"

# Other environment setup
export PATH="${PREFIX_DIRECTORY}/bin:$PATH"
