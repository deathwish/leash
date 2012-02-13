#!/bin/bash

PROCESS_NAME=$1
shift 1
COMMAND_LINE="${*}"

# TODO allow configuration of run directory
create_profile $PROCESS_NAME $SERVER_DIRECTORY "${COMMAND_LINE}"
