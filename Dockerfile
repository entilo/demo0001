FROM centos:7
MAINTAINER digdeep@126.com
ADD jdk-8u321-linux-i586.tar.gz /usr/local
ENV JAVA_HOME /usr/local/jdk1.8.0_181
ADD http://mirror.bit.edu.cn/apache/tomcat/tomcat-8/v8.5.50/bin/apache-tomcat-8.5.50.tar.gz /usr/local
RUN tar -xvf /usr/local/apache-tomcat-8.5.50.tar.gz -C /usr/local/
ENTRYPOINT ["/usr/local/apache-tomcat-8.5.50/bin/catalina.sh", "run"]
EXPOSE 8080
