#!/bin/sh

source ./setup/create_directory_structure.sh
source ./setup/build_and_install_server.sh

create_profile "mongrel2" $SERVER_DIRECTORY "m2sh start -db config.sqlite -name main" "${RUN_DIRECTORY}/mongrel2.pid"