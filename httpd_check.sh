#!/bin/bash
date=`date +%Y-%m-%d`
date_time=`date +%Y-%m-%d_%H:%M:%S`
logs_back=/home/check/apache/apache.check.logs
logs_file=$logs_back/$date.apache.check.logs
mkdir -p /home/check/apache/apache.check.logs
touch $logs_file
apache_port=`netstat -nlt |grep 88 |awk '{print $4}'| cut -d : -f 2`
echo ""  >> $logs_file
echo "------------------Time Now: $date_time--------------------" >> $logs_file
echo "apache_port:$apache_port" >> $logs_file
if [ "$apache_port" = "88" ];then
        echo "------------------Time Now: $date_time--------------------" >> $logs_file
        echo "------------------ps -ef |grep apache --------------------" >> $logs_file
        ps -ef |grep apache >> $logs_file
        echo "------------------result------------------" >> $logs_file
        echo 'apache server is running!!' >> $logs_file
        echo "------------------result------------------" >> $logs_file
else
        echo "------------------Time Now: $date_time--------------------" >> $logs_file
        echo "------------------result------------------" >> $logs_file
        echo 'apache server is stopped!!'  >> $logs_file
        echo "------------------result------------------" >> $logs_file
        echo '------------------start httpd : lnmp httpd restart------------------' >> $logs_file
        lnmp httpd restart >> $logs_file
        apache_start_port=`netstat -nlt |grep 88 |awk '{print $4}'| cut -d : -f 2`
        echo "apache_start_port:$apache_start_port" >> $logs_file
        if [ "$apache_start_port"="88" ];then
                echo "------------------Time Now: $date_time--------------------" >> $logs_file
                echo "------------------ps -ef |grep apache --------------------" >> $logs_file
                ps -ef |grep apache >> $logs_file
                echo "------------------result------------------" >> $logs_file
                echo 'apache service started Successfully!' >> $logs_file
                echo "------------------result------------------" >> $logs_file
        else
                echo "------------------Time Now: $date_time--------------------" >> $logs_file
                echo "------------------result------------------" >> $logs_file
                echo 'apache service started Failed!' >> $logs_file
                echo "------------------result------------------" >> $logs_file
        fi
fi
