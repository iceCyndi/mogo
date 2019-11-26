#!/bin/sh
#running the process cwmd and then starting loginapp
#timerd dbmgr base cell 
echo "[running process cwmd......]"
who=`whoami`
echo $who
path=`pwd`
${path}/loginapp ./cfg.ini 1 ./log/loginlog_1




