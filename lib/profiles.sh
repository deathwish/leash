#!/bin/bash

create_profile() {
	 PROFILE_NAME=$1
	 PROCESS_DIRECTORY=$2
	 RUN_COMMAND=$3
	 PIDFILE="${RUN_DIRECTORY}/${PROFILE_NAME}.pid"
	 CREATE_PROFILE_DIRECTORY="${PROFILE_DIRECTORY}/${PROFILE_NAME}"
	 CURRENT_DIRECTORY="$(pwd)"

     delete_profile $PROFILE_NAME

	 mkdir -p $CREATE_PROFILE_DIRECTORY
	 
	 cd $CREATE_PROFILE_DIRECTORY

	 echo '' > depends

	 echo $PIDFILE > pid_file
	 
	 echo '#!/bin/bash' > run
	 echo '' >> run
	 echo "export LEASH_PIDFILE='${PIDFILE}'" >> run
	 echo '' >> run
	 echo "cd $PROCESS_DIRECTORY" >> run
	 echo "nohup ${RUN_COMMAND} > ${LOG_DIRECTORY}/${PROFILE_NAME}.log &" >> run
	 echo "sleep 2 # wait for ${PROFILE_NAME} to come up and write its pidfile." >> run
	 chmod +x run

	 cd $CURRENT_DIRECTORY
}

delete_profile() {
    PROFILE_NAME=$1
    DELETE_PROFILE_DIRECTORY="${PROFILE_DIRECTORY}/${PROFILE_NAME}"

	if [ -d $DELETE_PROFILE_DIRECTORY ]
	then
		rm -rf $DELETE_PROFILE_DIRECTORY
	fi
}
