#!/bin/bash
set -eu 

java -jar -Dspring.datasource.url=jdbc:oracle:thin:@//${ORACLE_IP}:1521/${ORACLE_SCHEME} -Dspring.datasource.password=${ORACLE_PASS} /app/shop.jar
