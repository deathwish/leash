#!/bin/sh

#
# Download source from the given remote path into $DOWNLOAD_DIRECTORY.
# Example: download_package_source "zeromq-2.1.10.tar.gz" "http://download.zeromq.org"
#
download_package_source() {
	 URL=$1

	 TARBALL=$(basename $URL)

	 if [ ! -f "${DOWNLOAD_DIRECTORY}/${TARBALL}" ];
	 then
		  wget --directory-prefix=$DOWNLOAD_DIRECTORY $URL
	 fi

	 return $?
}

#
# Extracts compressed sources in $DOWNLOAD_DIRECTORY into $BUILD_DIRECTORY.
# Example: extract_package_source "zeromq-2.1.10.tar.gz"
#
extract_package_source() {
	 TARBALL=$1
	 EXTENSION=${TARBALL##*.}

	 if [ $EXTENSION == 'gz' ];
	 then
		  COMPRESSION_FLAG='--gzip'
	 elif [ $EXTENSION == 'bz2' ];
	 then
		  COMPRESSION_FLAG='--bzip2'
	 else
		  return 1
	 fi

	 tar --directory=$BUILD_DIRECTORY --extract $COMPRESSION_FLAG --file="${DOWNLOAD_DIRECTORY}/${TARBALL}"

	 return $?
}

