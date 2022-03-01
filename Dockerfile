FROM centos:7
MAINTAINER entilo

ADD apache-tomcat-9.0.8-deployer.tar.gz /usr/local
RUN tar -xvf /usr/local/apache-tomcat-8.5.50.tar.gz -C /usr/local/

ADD jdk-8u321-linux-x64.tar.gz /usr/local
RUN tar -xvf jdk-8u321-linux-x64.tar.gz -C /usr/local/
ENV JAVA_HOME /usr/local/jdk1.8.0_181



ENTRYPOINT ["/usr/local/apache-tomcat-8.5.50/bin/catalina.sh", "run"]
EXPOSE 8080
