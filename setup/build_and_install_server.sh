#!/bin/sh

for FILE in setup/lib/*.sh
do
	 source "$FILE"
done
PATH="$(pwd)/setup/build:${PATH}"

#
# Gets the source package from the specified URL, extracts it, and runs the configured compile command in the build directory, 
# passing it the compile prefix.
# Example: executing build_and_install "http://www.sqlite.org/sqlite-autoconf-3070900.tar.gz" would download and extract the file,
# then attempt to run build_sqlite-autoconf $PREFIX in the source directory.
#
build_and_install() {
	 CURRENT_DIRECTORY=$(pwd)
	 DOWNLOAD_DIRECTORY="${CURRENT_DIRECTORY}/files"
	 BUILD_DIRECTORY="${CURRENT_DIRECTORY}/build"
	 OUTPUT_DIRECTORY="${CURRENT_DIRECTORY}/usr"
	 BUILD_LOG="${BUILD_DIRECTORY}/build.log"

	 URL=$1
	 TARBALL=$(basename $URL)
	 PACKAGE_DIRECTORY=$(echo $URL | sed 's/.*\/\(.*\).tar.\(gz\|bz2\)/\1/')
	 PACKAGE_NAME=$(echo $URL | sed 's/.*\/\(.*\)-.*/\1/')

	 log $BUILD_LOG "Downloading ${PACKAGE_DIRECTORY}"
	 checked_command $BUILD_LOG download_package_source $URL $DOWNLOAD_DIRECTORY

	 log $BUILD_LOG "Extracting ${PACKAGE_DIRECTORY}"
	 checked_command $BUILD_LOG extract_package_source "${DOWNLOAD_DIRECTORY}/${TARBALL}" $BUILD_DIRECTORY

	 log $BUILD_LOG "Compiling ${PACKAGE_DIRECTORY}"
	 cd "${BUILD_DIRECTORY}/${PACKAGE_DIRECTORY}"
	 checked_command $BUILD_LOG "${PACKAGE_NAME}.sh" $OUTPUT_DIRECTORY
	 cd $CURRENT_DIRECTORY
}

build_and_install "http://www.sqlite.org/sqlite-autoconf-3070900.tar.gz"
build_and_install "http://prdownloads.sourceforge.net/e2fsprogs/e2fsprogs-1.41.14.tar.gz"
build_and_install "http://download.zeromq.org/historic/zeromq-2.1.7.tar.gz"
build_and_install "http://mongrel2.org/static/downloads/mongrel2-1.7.5.tar.bz2"