Work with Oracle Weblogic

* domain.properties

Fichero de variables de entorno que se le pasa a docker en tiempo de lanzamiento del contenedor.

* hello-world.war

La aplicación a desplegar. Es el hola mundo que presenta la sample app de tomcat.

* Lanzar el contenedor

docker run -ti --rm -u root:root --name wlsadmin -p 7001:7001 --hostname wlsadmin -e ADMIN_PASSWORD=Test1234 --env-file ${WORKSPACE}/app/domain.properties weblogic-app

* Test

En el directorio gaugeWeblogic están los test que comprueban que la app se ha levantado con el titulo correcto.

* Docker

El contenedor se construlle sencillamente añadiendo el war a la imagen de Weblogic