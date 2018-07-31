
Jenkins files usados para Latinia, para mostrar distintas configuraciones y ejemplos.

* Jenkinsfile

  Pipeline completo de ejemplo en el que se ven todas las fases por la que puede pasar una aplicación. 
  1. Clonar el repo 
  2. Instalar las dependencias 
  3. Construir el paquete 
  4. Crear el contenedor Docker 
  5. Comprobar que se ha construido correctamente. 
  6. Subir la imagen a nuestro repositorio particular.

* Jenkinsfile.springboot-oracle

Spring Boot application con Oracle. Esta app es un jar que se lanza con un run.sh aun así está a fuego en el properti de la app que se encuentra en latinia/spring-boot-oracle-example-master 

* Jenkinsfile.testapp.rubyrails-gauge

Testing de una aplicación web dockerizada con Gauge dockerizado.

* Jenkinsfile.testapp.springboot-weblogic-oracle

Trabajando para pasar la aplicación springboot a weblogic. No funciona ahora mismo porque se genera un JAR y no un WAR por lo que el despliegue en Websphere (ocurre lo mismo en weblogic) falla. También lo he probado directamente en Tomcat.

* Jenkinsfile.testapp.weblogic

Este job es crea un contenedor con un war que está en GitHub y le pasa un test con Gauge+Sahi que detecta el que el título es correcto. Si supera el test, pushea la imagen a nuestro registry privado.

* Jenkinsfile.testapp.websphere

Este job es crea un contenedor con un war que está en GitHub y le pasa un test con Gauge+Sahi que detecta el que el título es correcto. Si supera el test, pushea la imagen a nuestro registry privado.
