
Jenkins files usados para Latinia, para mostrar distintas configuraciones y ejemplos.

* Jenkinsfile

  Pipeline completo de ejemplo en el que se ven todas las fases por la que puede pasar una aplicación. 
  1. Clonar el repo 
  2. Instalar las dependencias 
  3. Construir el paquete 
  4. Crear el contenedor Docker 
  5. Comprobar que se ha construido correctamente. 
  6. Subir la imagen a nuestro repositorio particular.

* Jenkinsfile.testapp.rubyrails-gauge

Testing de una aplicación web dockerizada con Gauge dockerizado.

* Jenkinsfile.testapp.weblogic

Este job es un smoke test con curl que espera recibir un 200. 
Toma un war que está en GitHub y lo pasa al contendor con **Weblogic** al directorio **autodeploy** para que se lance en tiempo de ejecución.

* Jenkinsfile.testapp.websphere

Este job es un smoke test con curl que espera recibir un 200. 
Toma un war que está en GitHub y lo pasa al contendor con **Websphere** al directorio **dropins** para que se lance en tiempo de ejecución. 
