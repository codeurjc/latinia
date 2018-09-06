#!/bin/bash 

/usr/bin/Xvfb :99 -screen 0 1024x768x16 &

cd ${WORKSPACE}/weblogic2/gauge
gauge run specs/0.1Comprobar.spec > output.txt

cat output.txt

COMMAND="cat ${WORKSPACE}/weblogic2/gauge/output.txt | grep \"ERR:\""
eval $COMMAND
RES=$?

# Saving reports
tar czf ${WORKSPACE}/reports.tar.gz ${WORKSPACE}/weblogic2/gauge/reports/html-report

if [ "$RES" == "1" ]; then
  exit 0
else
  exit 1
fi
