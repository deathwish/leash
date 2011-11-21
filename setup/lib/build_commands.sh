#!/bin/sh

#
# Print the preprocessor flags for the given prefix.
# Example: preprocessor_flags "/opt/terrorizer" might print "-L/opt/terrorizer/include"
#
preprocessor_flags() {
	 PREFIX=$1

	 echo "-I${PREFIX}/include"
}
export -f preprocessor_flags

#
# Print the linker flags for the given prefix.
# Example: linker_flags "/opt/terrorizer" might print "-L/opt/terrorizer/lib"
#
linker_flags() {
	 PREFIX=$1

	 echo "-L${PREFIX}/lib -Wl,--rpath -Wl,${PREFIX}/lib"
}
export -f linker_flags

#
# Run configure, make, and make install in the current directory, setting the prefix and optionally providing package specific flags.
# Optionally, a subdirectory to build may be provided in which make should be run rather then in the source root. This allows us to only
# build libuuid out of the e2fsprogs source.
# Examples: configure "/opt/sqlite" "--disable-readline" or automake_compile "/opt/zmq" "" "a_submodule"
#
automake_compile() {
	 PREFIX=$1
	 OPTIONS=$2
	 CURRENT_DIRECTORY=$(pwd)
	 BUILD_IN="./$3"

	 CPPFLAGS=$(preprocessor_flags $PREFIX) LDFLAGS=$(linker_flags $PREFIX) ./configure --prefix=$PREFIX $OPTIONS
	 cd $BUILD_IN
	 make
	 make install
	 cd $CURRENT_DIRECTORY

	 return $?
}
export -f automake_compile
