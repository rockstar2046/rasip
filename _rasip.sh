#!/bin/sh
### BEGIN INIT INFO
# Provides:          rasip
# Required-Start:    $local_fs $remote_fs $named $network $time
# Required-Stop:     $local_fs $remote_fs $named $network $time
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 
# Short-Description: Speak ip address on raspberry pi
# Description:       Enable auto speak local ip adress and play welcome sound raspberry pi
### END INIT INFO

# Author: RA <rockagen@gmail.com>


do_start(){
	# check command
	type  awk sed tar mplayer > /dev/null 2>&1

	if [ $? -ne 0 ]
	then
		echo "Program need 'awk, sed, tar, mplayer', please install them, -_-"
		exit 1;
	fi

	TMP_DIR="/tmp/rasip$(date +%s)"

	mkdir -p $TMP_DIR

	ARCHIVE=`awk '/^__ARCHIVE_CONTENT__/ {print NR+1;exit 0;}' "$0"`

	tail -n+$ARCHIVE "$0" | tar zxm -C $TMP_DIR  > /dev/null 2>&1

	if [ $? -ne 0 ]
	then
		echo "rasip run faild"
		rm -rf $TMP_DIR
		exit 1;
	fi

	cd $TMP_DIR

    ## main 
    # speak ip address
    mplayer -speed 1.5 looking $(hostname -I | cut -f1 -d " " | sed 's/\./d/g' | sed 's/./&\ /g') > /dev/null 2>&1
    # delay
    sleep 3
    # play started sound
    mplayer start.ogg welcome.flac > /dev/null 2>&1
    
    # rm tmp dir
    rm -rf $TMP_DIR
}

case "$1" in

	stop|restart|reload|force-reload|status)
		;;
	*)
		do_start
		;;
esac

exit 0


#This line must be the last line of the file
__ARCHIVE_CONTENT__
