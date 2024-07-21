#!/bin/sh
set -eu

umask 077
period=5
dirpath='/home/menta/'
filename=`date +%y%m%d`
mysqldump  --defaults-extra-file=/etc/my_sql.conf -uroot -p wordpress --events | gzip -c > $dirpath/$filename.sql
oldfile=`date --date "$period days ago" +%y%m%d`
rm -f $dirpath/$oldfile.sql