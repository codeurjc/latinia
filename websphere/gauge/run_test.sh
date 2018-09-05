#!/bin/bash 

/usr/bin/Xvfb :99 -screen 0 1024x768x16 &

cd ${WORKSPACE}/websphere/gauge
gauge run specs/0.1Comprobar.spec > output.txt

cat output.txt
COMMAND="cat ${WORKSPACE}/websphere/gauge/output.txt | grep \"ERR:\""
eval $COMMAND
RES=$?

# Saving reports
tar czf ${WORKSPACE}/reports.tar.gz ${WORKSPACE}/websphere/gauge/reports/html-report

exit $RES
