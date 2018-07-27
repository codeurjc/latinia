#!/bin/bash 

/usr/bin/Xvfb :99 -screen 0 1024x768x16 &

cd ${WORKSPACE}/websphere/gauge
gauge run specs/0.1Comprobar.spec > output.txt

cat output.txt

RES=$(cat ${WORKSPACE}/websphere/gauge/output.txt | grep "ERR:")

if [ z"$RES" == z"" ]; then
  echo "Salgo"
  exit 0
else
  exit $RES
fi
