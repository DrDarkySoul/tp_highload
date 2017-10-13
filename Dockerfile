FROM ubuntu:16.04

MAINTAINER Denis Stepanov

RUN apt-get -y update

RUN apt-get install -y openjdk-8-jdk-headless
RUN apt-get install -y maven

ENV WORK /opt
ADD . $WORK/java/
RUN mkdir -p /var/www/html

WORKDIR $WORK/java
RUN mvn package

EXPOSE 80

CMD java -jar $WORK/java/target/server-1.0-SNAPSHOT-jar-with-dependencies.jar