En este directorio están los ficheros necesarios para ejemplo de test de una aplicación web.

## gauge-docker

En este directorio generamos una imagen docker con:

1. Java
2. Chrome
3. Gauge + Gauge plugins
4. Supervisord

Con esta imagen puedes ejecutar tests de Gauge a un sistema remoto usando el browser Chrome que tiene de serie.

Para que funciones, usamos supervisord que es el encargado de levantar un wrapper de las X: _xvfb_

No tiene el webdriver pero puedes establecer la dependencia en el pom.xml de tu proyecto para que se levante automáticamente.

## java-maven-selenium

Es un proyecto maven con los TEST.

Para lanzar los test:

`mvn test`

Para configurar donde está la aplicación editamos el fichero:

`java-maven-selenium/env/default/user.properties`

## TestApp

La TestApp es nuestro SUT. Es una aplicación Ruby on Rails que corremos dockerizada.

Para construir la imagen, desde el directorio con el Dockerfile:

`docker build -t gauge-test-app .`

Lanzamos el contenedor:

`docker run -d --rm --name gauge-test -p 8000:8000 gauge-test-app`

Podemos consultar que está ocurriendo en la aplicación

`docker logs -f gauge-test`

Para finalizar:

`docker stop gauge-test`
`docker rm gauge-test` 