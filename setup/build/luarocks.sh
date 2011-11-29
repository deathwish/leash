#!/bin/sh

automake_compile $1 "--force-config --sysconfdir=$1/etc/luarocks --with-lua=$1"