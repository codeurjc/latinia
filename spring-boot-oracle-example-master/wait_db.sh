#!/bin/bash 

sleep 1m

while true
do 
  docker logs oracledb | grep "Completed: ALTER DATABASE OPEN"
  if [ $? == 0 ]; then
    break
  fi
  sleep 1
done
