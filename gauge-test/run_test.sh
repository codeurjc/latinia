#!/bin/bash 

/usr/bin/Xvfb :99 -screen 0 1024x768x16 &

gauge run specs/0.1Comprobar.spec > output.txt

cat output.txt
COMMAND="cat output.txt | grep \"ERR:\""
eval $COMMAND
RES=$?

exit $RES
