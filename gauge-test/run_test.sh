#!/bin/bash -x

XVFB=$(ps ax | grep "[/]usr/bin/Xvfb :99" | wc -l)
if [ ! ${XVFB} == 1 ]; then
	/usr/bin/Xvfb :99 -screen 0 1024x768x16 &
	sleep 5
fi

gauge run specs/0.1Comprobar.spec > output.txt

cat output.txt

