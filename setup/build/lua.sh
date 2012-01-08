#!/bin/sh

#
# Runs Make with compiler flags setup to match the convention used by the Lua makefile.
# Read the makefile in question for more details.
#
lua_make() {
	 PREFIX=$1
	 TARGETS=$2

	 make MYCFLAGS="$(preprocessor_flags $PREFIX) -DLUA_USE_LINUX" \
		  MYLIBS="$(linker_flags $PREFIX) -Wl,-E -ldl -lreadline -lhistory -lncurses" \
		  INSTALL_TOP=$PREFIX \
		  $TARGETS

	 return $?
}


cd src
# LUA_ROOT is hardcoded to /usr/local/ regardless of what INSTALL_TOP has been set to.
# This causes the default require path to be in /usr/local/, rather then in our $PREFIX.
sed -i "s#\"/usr/local/\"#\"${1}/\"#" luaconf.h
lua_make $1 all
cd ..
lua_make $1 test
lua_make $1 install
