Work with IBM WebSphere

* Launching Docker

docker run -ti --rm --name websphere -p 9080:9080 -v /home/nordri/temp/websphere/DefaultServletEngine/dropins/Sample1.war:/config/dropins/Sample1.war websphere-liberty:webProfile8

* Sample1.war

La aplicación a desplegar. Es el hola mundo que presenta la sample app de WebLogic.

Se accede a la app http://localhost:9080/Sample1/