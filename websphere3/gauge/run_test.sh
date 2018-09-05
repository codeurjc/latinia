#!/bin/bash -x

/usr/bin/Xvfb :99 -screen 0 1024x768x16 &

cd ${WORKSPACE}/websphere3/gauge
gauge run specs/0.1Comprobar.spec > output.txt

cat output.txt

COMMAND="cat ${WORKSPACE}/websphere3/gauge/output.txt | grep \"ERR:\""
eval $COMMAND
RES=$?

# Saving reports
tar czf ${WORKSPACE}/reports.tar.gz ${WORKSPACE}/websphere3/gauge/reports/html-report

exit $RES

