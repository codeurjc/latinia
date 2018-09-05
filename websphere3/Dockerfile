FROM ibmcom/websphere-traditional:8.5.5.11-profile

COPY sample1.war /tmp/

RUN wsadmin.sh -lang jython -conntype NONE -c "AdminApp.install('/tmp/sample1.war', '[ -appname Sample1 -contextroot /sample1 -MapWebModToVH [[ sample1.war sample1.war,WEB-INF/web.xml default_host]]]')"