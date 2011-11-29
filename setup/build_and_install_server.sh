#!/bin/sh

for FILE in setup/lib/*.sh
do
	 source "$FILE"
done
PATH="${LEASH_DIRECTORY}/setup/build:${PATH}"

#
# Gets the source package from the specified URL, extracts it, and runs the configured compile command in the build directory, 
# passing it the compile prefix.
# Example: executing build_and_install "http://www.sqlite.org/sqlite-autoconf-3070900.tar.gz" would download and extract the file,
# then attempt to run build_sqlite-autoconf $PREFIX in the source directory.
#
build_and_install() {
	 URL=$1
	 TARBALL=$(basename $URL)
	 PACKAGE_DIRECTORY=$(echo $URL | sed 's/.*\/\(.*\).tar.\(gz\|bz2\)/\1/')
	 PACKAGE_NAME=$(echo $URL | sed 's/.*\/\(.*\)-.*/\1/')

	 log $BUILD_LOG "Downloading ${PACKAGE_DIRECTORY}"
	 checked_command $BUILD_LOG download_package_source $URL $DOWNLOAD_DIRECTORY

	 log $BUILD_LOG "Extracting ${PACKAGE_DIRECTORY}"
	 checked_command $BUILD_LOG extract_package_source "${DOWNLOAD_DIRECTORY}/${TARBALL}" $BUILD_DIRECTORY

	 log $BUILD_LOG "Compiling ${PACKAGE_DIRECTORY}"
	 CURRENT_DIRECTORY=$(pwd)
	 cd "${BUILD_DIRECTORY}/${PACKAGE_DIRECTORY}"
	 checked_command $BUILD_LOG "${PACKAGE_NAME}.sh" $PREFIX_DIRECTORY
	 cd $CURRENT_DIRECTORY
}

while read PACKAGE_URL
do
	 build_and_install $PACKAGE_URL
done < "${DATA_DIRECTORY}/dependencies.txt"
