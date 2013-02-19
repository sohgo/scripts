#!/bin/bash
if [ "$LASTDIRFILE" = "" ];then
  LASTDIRFILE=$HOME/.lastDir
fi
touch $LASTDIRFILE
LASTDIRFILETMP=$HOME/.lastDir.tmp
tail -n19 $LASTDIRFILE > $LASTDIRFILETMP
LASTDIR=`tail -n1 $LASTDIRFILE`
CURDIR=`pwd -P`
if [ "$LASTDIR" != $CURDIR ];then
  cat $LASTDIRFILETMP > $LASTDIRFILE
  echo $CURDIR >> $LASTDIRFILE
fi
rm -rf $LASTDIRFILETMP