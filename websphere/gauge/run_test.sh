#!/bin/bash
set -eu -o pipefail

WS=$1

/usr/bin/Xvfb :99 -screen 0 1024x768x16 &

cd ${WS}/websphere/gauge
gauge run specs/0.1Comprobar.spec > output.txt

cat output.txt

RES=$(grep "ERR:" ${WORKSPACE}/websphere/gauge/output.txt)

if [ "$RES" == '0' ]; then
  exit 0
else
  exit $RES
fi
