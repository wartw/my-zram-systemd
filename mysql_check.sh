#!/bin/bash
date=`date +%Y-%m-%d`
date_time=`date +%Y-%m-%d_%H:%M:%S`
logs_back=/home/check/mariadb/mariadb.check.logs
logs_file=$logs_back/$date.mariadb.check.logs
mkdir -p /home/check/mariadb/mariadb.check.logs
touch $logs_file
mariadb_port=`netstat -nlt |grep 3306 |awk '{print $4}'| cut -d : -f 2`
echo ""  >> $logs_file
echo "------------------Time Now: $date_time--------------------" >> $logs_file
echo "mariadb_port:$mariadb_port" >> $logs_file
if [ "$mariadb_port" = "3306" ];then
        echo "------------------Time Now: $date_time--------------------" >> $logs_file
        echo "------------------ps -ef |grep mariadb --------------------" >> $logs_file
        ps -ef |grep mariadb >> $logs_file
        echo "------------------result------------------" >> $logs_file
        echo 'mariadb server is running!!' >> $logs_file
        echo "------------------result------------------" >> $logs_file
else
        echo "------------------Time Now: $date_time--------------------" >> $logs_file
        echo "------------------result------------------" >> $logs_file
        echo 'mariadb server is stopped!!'  >> $logs_file
        echo "------------------result------------------" >> $logs_file
        echo '------------------start mariadb : lnmp ngnix restart------------------' >> $logs_file
        lnmp mariadb restart >> $logs_file
        mariadb_start_port=`netstat -nlt |grep 3306 |awk '{print $4}'| cut -d : -f 2`
        echo "mariadb_start_port:$mariadb_start_port" >> $logs_file
        if [ "$mariadb_start_port"="3306" ];then
                echo "------------------Time Now: $date_time--------------------" >> $logs_file
                echo "------------------ps -ef |grep mariadb --------------------" >> $logs_file
                ps -ef |grep mariadb >> $logs_file
                echo "------------------result------------------" >> $logs_file
                echo 'mariadb service started Successfully!' >> $logs_file
                echo "------------------result------------------" >> $logs_file
        else
                echo "------------------Time Now: $date_time--------------------" >> $logs_file
                echo "------------------result------------------" >> $logs_file
                echo 'mariadb service started Failed!' >> $logs_file
                echo "------------------result------------------" >> $logs_file
        fi
fi
