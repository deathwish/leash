#!/bin/sh

make posix 
make test
make install INSTALL_TOP=$PREFIX_DIRECTORY