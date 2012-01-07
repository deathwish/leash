#!/bin/sh

#
# Runs Make with compiler flags setup to match the convention used by the Lua makefile.
# Read the makefile in question for more details.
#
lua_make() {
	 PREFIX=$1
	 TARGETS=$2

	 make MYCFLAGS="$(preprocessor_flags $PREFIX) -DLUA_USE_LINUX" \
		  MYLDFLAGS="$(linker_flags $PREFIX) -Wl,-E -ldl -lreadline -lhistory -lncurses" \
		  INSTALL_TOP=$PREFIX \
		  $TARGETS

	 return $?
}


cd src
lua_make $1 all
cd ..
lua_make $1 test
lua_make $1 install