#!/bin/sh

automake_compile $1 "--force-config --sysconfdir=$1/etc/luarocks --with-lua=$1"
echo "variables[\"LIBFLAG\"] = \"-shared $(linker_flags ${1})\"" >> "${1}/etc/luarocks/config.lua"
