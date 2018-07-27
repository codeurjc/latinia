#!/bin/bash 

/usr/bin/Xvfb :99 -screen 0 1024x768x16 &

cd ${WORKSPACE}/app/gaugeWeblogic
gauge run specs/0.1Comprobar.spec > output.txt

cat output.txt

RES=$(cat ${WORKSPACE}/app/gaugeWeblogic/output.txt | grep "ERR:")

# Saving reports
tar czf ${WORKSPACE}/reports.tar.gz ${WORKSPACE}/app/gaugeWeblogic/reports/html-report

if [ z"$RES" == z"" ]; then
  exit 0
else
  exit $RES
fi
