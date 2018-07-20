#!/bin/bash
set -eu 

java -Dspring.datasource.url=jdbc:oracle:thin:@//${ORACLE_IP}:1521/${ORACLE_SCHEME} -Dspring.datasource.password=${ORACLE_PASS} -jar /app/shop.jar
