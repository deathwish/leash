#!/bin/bash

AVAILABLE_TARGETS=('integration')

REQUESTED_TARGETS=$*

if [ $# == 0 ]
then
	REQUESTED_TARGETS=$AVAILABLE_TARGETS
fi

for REQUESTED_TARGET in $REQUESTED_TARGETS
do
	FOUND_TARGET=0
	for AVAILABLE_TARGET in "${AVAILABLE_TARGETS[@]}"
	do
		if [ "${REQUESTED_TARGET}" == "${AVAILABLE_TARGET}" ]
		then
			FOUND_TARGET=1
			break
		fi
	done
	if [ $FOUND_TARGET != 1 ]
	then
		echo "${REQUESTED_TARGET} is an invalid test target, valid targets are ${AVAILABLE_TARGETS[@]}"
		exit 1
	fi
done

run_integration_tests() {
	cbsh
}

for TARGET in "${REQUESTED_TARGETS[@]}"
do
	echo "running ${TARGET} tests"
	"run_${TARGET}_tests"
done
