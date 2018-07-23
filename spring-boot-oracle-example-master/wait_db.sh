#!/bin/bash 

sleep 1m

while true
do 
  docker logs oracledb | grep "DATABASE IS READY TO USE!"
  if [ $? == 0 ]; then
    break
  fi
  sleep 1
done
