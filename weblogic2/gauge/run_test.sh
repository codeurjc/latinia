#!/bin/bash 

/usr/bin/Xvfb :99 -screen 0 1024x768x16 &

cd ${WORKSPACE}/weblogic2/gauge
gauge run specs/0.1Comprobar.spec > output.txt

cat output.txt

RES=$(cat ${WORKSPACE}/weblogic2/gauge/output.txt | grep "ERR:")

# Saving reports
tar czf ${WORKSPACE}/reports.tar.gz ${WORKSPACE}/weblogic2/gauge/reports/html-report

if [ z"$RES" == z"" ]; then
  exit 0
else
  exit $RES
fi
