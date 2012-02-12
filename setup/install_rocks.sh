#!/bin/bash

#
# Ensure that the given package name or url is locally available.
# If a package name is given, it is printed, otherwise the url is
# downloaded to $DOWNLOAD_DIRECTORY and 
# $DOWNLOAD_DIRECTORY/${PACKAGE_NAME}.rockspec is printed.
# Example: get_rock_installer_path lua_signal would print lua_signal,
# and get_rock_installer_path http://example.com/package.luarock would
# print ${DOWNLOAD_DIRECTORY}/package.luarock
#
get_rock_installer_path() {
	 ROCK_NAME=$1
	 
	 echo "${ROCK_NAME}" | grep -e 'http:\/\/.*\/*.luarock' > /dev/null
	 if [ $? == 0 ]
	 then
		  log $BUILD_LOG "Downloading luarock ${ROCK_NAME}"
		  download_package_source $ROCK_NAME
		  download_path_for_url $ROCK_NAME
	 else
		  echo $ROCK_NAME
	 fi
}

while read ROCK_NAME
do
	 ROCK_INSTALL_PATH="$(get_rock_installer_path $ROCK_NAME)"

	 log $BUILD_LOG "Installing luarock ${ROCK_INSTALL_PATH}"
	 checked_command $BUILD_LOG luarocks install $ROCK_INSTALL_PATH
done < "${DATA_DIRECTORY}/lua_dependencies.txt"