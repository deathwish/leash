#!/bin/bash

source ./setup/configuration.sh
source ./setup/create_directory_structure.sh
source ./setup/build_and_install_server.sh
source ./setup/install_rocks.sh

leash initialize_configuration
