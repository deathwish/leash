#!/bin/bash

#
# Runs Make with compiler flags setup to match the convention used by the Mongrel 2 makefile.
# Read the makefile in question for more details.
#
mongrel2_make() {
	 PREFIX=$1
	 TARGETS=$2

	 OPTFLAGS="$(preprocessor_flags $PREFIX) $(linker_flags $PREFIX)" PREFIX=$PREFIX make $TARGETS

	 return $?
}

PREFIX=$1

mongrel2_make $PREFIX "install"
CURRENT_DIRECTORY=$(pwd)
cd "examples/procer"
mongrel2_make $PREFIX "install"
cd $CURRENT_DIRECTORY