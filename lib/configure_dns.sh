#!/bin/bash

NSS_TLD_MAPPER_SO="${PREFIX_DIRECTORY}/lib/libnss_tld_mapper.so.2"
if [ -f $NSS_TLD_MAPPER_SO ]
then
	export LD_PRELOAD="${NSS_TLD_MAPPER_SO} ${LD_PRELOAD}"
	export TLD_MAPPER_TLD='.dev'
	export TLD_MAPPER_SERVICES=`sed -n 's/^hosts: *\(.*\)$/\1/p' /etc/nsswitch.conf`
fi