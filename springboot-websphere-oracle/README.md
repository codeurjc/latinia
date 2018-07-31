# Spring Boot Weblogic Oracle Example

* To run this example you will need to download and install the Oracle JDBC driver.
* You can install the Oracle Jar into your local Maven repsository using this command: `mvn install:install-file -Dfile=ojdbc7.jar -DgroupId=com.oracle -DartifactId=ojdbc7 -Dversion=12.1.0.2 -Dpackaging=jar`

mvn -DskipTests=true install package

Hay que generar un WAR para que funcione.