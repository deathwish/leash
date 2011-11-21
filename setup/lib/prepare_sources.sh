#!/bin/sh

#
# Download source from the given remote path into the given directory.
# Example: download_package_source "zeromq-2.1.10.tar.gz" "http://download.zeromq.org" "files"
#
download_package_source() {
	 URL=$1
	 TARGET_DIRECTORY=$2

	 TARBALL=$(basename $URL)

	 if [ ! -f "${TARGET_DIRECTORY}/${TARBALL}" ];
	 then
		  wget --directory-prefix=$TARGET_DIRECTORY $URL
	 fi

	 return $?
}

#
# Extracts compressed sources into a target directory.
# Example: extract_package_source "files/zeromq-2.1.10.tar.gz" "build"
#
extract_package_source() {
	 TARBALL_PATH=$1
	 TARGET_DIRECTORY=$2
	 EXTENSION=${TARBALL_PATH##*.}

	 if [ $EXTENSION == 'gz' ];
	 then
		  COMPRESSION_FLAG='--gzip'
	 elif [ $EXTENSION == 'bz2' ];
	 then
		  COMPRESSION_FLAG='--bzip2'
	 else
		  return 1
	 fi

	 tar --directory=$TARGET_DIRECTORY --extract $COMPRESSION_FLAG --file=$TARBALL_PATH

	 return $?
}

