#!/bin/bash
 
# cutoff=$(date +"%Y%m%d" --date='-2 day') # 2 day lag
# arg1=($1 +"%Y%m%d")
 
body=$1
subject=$2; subject=$(echo $subject | sed -e 's/-/ /g')
address=$3
 
if [ -e $body ]; then body=`cat $body`; fi # if file exists then body is contents of file; else leave it as a string
 
# echo $cutoff
# echo $arg1
 
# if [ $cutoff -ge $1 ];
# then
# echo "body of email test" | mail -s "test subject line" tpalacio@renttherunway.com
 
echo "$body" | mailx -s "$subject" $address
 
# else
#     echo "no"
# fi
