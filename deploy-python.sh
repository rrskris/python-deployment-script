#!/bin/bash

#############################
#Author	: Vamshi Santhapuri #
#Email	: rrskris@gmail.com #
#############################


APP_DIR=$2
OPTION=$1
PORT=8001


usage() {
if [ ! $1  ]
then
        echo -e "Invalid directory...\nUsage ./python-deploy.sh <deploy|start|stop|restart> git-directory"
        exit 1
fi
}

start() {
virtualenv -p python3 $APP_DIR
ls
. ./$APP_DIR/bin/activate
cd $APP_DIR
pwd
pip install -r requirements.txt
echo -e "starting process.."
nohup python manage.py runserver 127.0.0.1:"$PORT" 2>&1 &
}

stop() {
echo -e "Stopping Django Server\nKilling PID"
ps -ef | grep python  | grep -E "$PORT"  | grep -v grep | awk {'print $2'} | xargs -I {} kill -9 {}
}

case "$OPTION" in

deploy)
ls $APP_DIR 2> /dev/null
eq=`echo $?`
if [ $eq -ne 0  ]
then
	usage
        exit 1
else
start
fi
;;

stop)
stop
;;

restart)
ls $APP_DIR 2> /dev/null
eq=`echo $?`
if [ $eq -ne 0  ]
then
	usage
        exit 1
else
stop
echo -e "Stopped process.."
sleep 1
start
fi	
;;

*)
exit 1
;;
esac
