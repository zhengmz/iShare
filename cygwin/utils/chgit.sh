#!/bin/sh

APPPATH=$1

if [ -z "$APPPATH" ]; then APPPATH=`pwd`; fi

#echo $APPPATH

#find $APPPATH -type d -print | xargs chmod 755
#find $APPPATH -type f -print | xargs chmod 644
#find $APPPATH -name .git -prune -o -type f -print | xargs git checkout --

find $APPPATH -type d -exec chmod 755 {} \;
find $APPPATH -type f -exec chmod 644 {} \;
find $APPPATH -name .git -prune -o -type f -exec git checkout -- {} \;

