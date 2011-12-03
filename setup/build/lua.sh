#!/bin/sh

make linux
make test
make install INSTALL_TOP=$PREFIX_DIRECTORY