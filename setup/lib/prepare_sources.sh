#!/bin/bash

#
# Download source from the given remote path into $DOWNLOAD_DIRECTORY.
# Example: download_package_source "zeromq-2.1.10.tar.gz" "http://download.zeromq.org"
#
download_package_source() {
	 URL=$1

	 if [ ! -f $(download_path_for_url $URL) ];
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
	 URL=$1
	 EXTENSION=${URL##*.}

	 if [ $EXTENSION == 'gz' ];
	 then
		  COMPRESSION_FLAG='--gzip'
	 elif [ $EXTENSION == 'bz2' ];
	 then
		  COMPRESSION_FLAG='--bzip2'
	 else
		  return 1
	 fi

	 tar --directory=$BUILD_DIRECTORY --extract $COMPRESSION_FLAG --file=$(download_path_for_url $URL)

	 return $?
}

#
# Prints the path to a file downloaded from the given url.
# Example: download_path_for_url "http://example.com/package.tar.gz" would print 'package.tar.gz'.
#
download_path_for_url() {
	 URL=$1

	 echo "${DOWNLOAD_DIRECTORY}/$(basename $URL)"
}