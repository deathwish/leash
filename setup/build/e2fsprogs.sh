#!/bin/sh

automake_compile $1 "--disable-debugfs --disable-imager --disable-resizer --disable-uuidd --disable-nls --enable-elf-shlibs" "lib/uuid"

