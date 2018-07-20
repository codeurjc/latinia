# Spring Boot Oracle Example

* To run this example you will need to download and install the Oracle JDBC driver.
* You can install the Oracle Jar into your local Maven repsository using this command: `mvn install:install-file -Dfile=ojdbc7.jar -DgroupId=com.oracle -DartifactId=ojdbc7 -Dversion=12.1.0.2 -Dpackaging=jar`

mvn -DskipTests=true install package

java -jar -Dspring.datasource.url=jdbc:oracle:thin:@//192.168.1.54:1521/ORCLPDB1 -Dspring.datasource.password=Test1234 spring-boot-oracle-0.0.1-SNAPSHOT.jar