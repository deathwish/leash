#!/bin/bash

checked_command $BUILD_LOG rm -rf $SERVER_DIRECTORY

checked_command $BUILD_LOG mkdir -p $SERVER_DIRECTORY
checked_command $BUILD_LOG mkdir -p $LOG_DIRECTORY
checked_command $BUILD_LOG mkdir -p $PROFILE_DIRECTORY
checked_command $BUILD_LOG mkdir -p $RUN_DIRECTORY
checked_command $BUILD_LOG mkdir -p $TMP_DIRECTORY
checked_command $BUILD_LOG mkdir -p $DATABASE_DIRECTORY

create_profile "mongrel2" $SERVER_DIRECTORY 'm2sh start -db ${CONFIG_DATABASE} -name main'

rm -f $CONFIG_DATABASE
m2sh load -config 'data/default_mongrel2.conf' -db $CONFIG_DATABASE
