#!/bin/sh

log $BUILD_LOG "Creating directories..."
checked_command $BUILD_LOG mkdir -p $BUILD_DIRECTORY
checked_command $BUILD_LOG mkdir -p $DOWNLOAD_DIRECTORY
checked_command $BUILD_LOG mkdir -p "usr"
checked_command $BUILD_LOG mkdir -p "usr/bin"
checked_command $BUILD_LOG mkdir -p "usr/include"
checked_command $BUILD_LOG mkdir -p "usr/lib"
checked_command $BUILD_LOG mkdir -p "usr/share"

checked_command $BUILD_LOG mkdir -p $SERVER_DIRECTORY
checked_command $BUILD_LOG mkdir -p $LOG_DIRECTORY
checked_command $BUILD_LOG mkdir -p $PROFILE_DIRECTORY
checked_command $BUILD_LOG mkdir -p $RUN_DIRECTORY
checked_command $BUILD_LOG mkdir -p $TMP_DIRECTORY