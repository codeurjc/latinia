FROM java:8

WORKDIR /app

ADD spring-boot-oracle-0.0.1-SNAPSHOT.jar /app/shop.jar
ADD run.sh /run.sh

EXPOSE 8080

CMD /run.sh