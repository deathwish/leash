#!/bin/sh

create_profile() {
	 PROFILE_NAME=$1
	 RUN_DIRECTORY=$2
	 RUN_COMMAND=$3
	 PID_FILE=$4
	 CREATE_PROFILE_DIRECTORY="${PROFILE_DIRECTORY}/${PROFILE_NAME}"
	 CURRENT_DIRECTORY="$(pwd)"

	 if [ -d $CREATE_PROFILE_DIRECTORY ]
	 then
		  rm -rf $CREATE_PROFILE_DIRECTORY
	 fi

	 mkdir -p $CREATE_PROFILE_DIRECTORY
	 
	 cd $CREATE_PROFILE_DIRECTORY

	 echo '' > depends

	 echo $PID_FILE > pid_file
	 
	 echo '#!/bin/sh' > run
	 echo '' >> run
	 echo "cd $RUN_DIRECTORY" >> run
	 echo "nohup ${RUN_COMMAND} > ${LOG_DIRECTORY}/${PROFILE_NAME}.log &" >> run
	 echo "sleep 2 # wait for ${PROFILE_NAME} to come up and write its pidfile." >> run
	 chmod +x run

	 cd $CURRENT_DIRECTORY
}
