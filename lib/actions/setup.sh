#!/bin/sh

source ./setup/configuration.sh
source ./setup/create_directory_structure.sh
source ./setup/build_and_install_server.sh
source ./setup/install_rocks.sh

create_profile "mongrel2" $SERVER_DIRECTORY "m2sh start -db ${CONFIG_DATABASE} -name main" "${RUN_DIRECTORY}/mongrel2.pid"
leash initialize_configuration
