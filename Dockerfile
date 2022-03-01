FROM centos:7
MAINTAINER entilo

ENV WORK_HOME /usr/local

java -version

#设置进入容器后的主目录
WORKDIR $WORK_HOME

#拷贝说明文件
COPY Read.ME $WORK_HOME/Read.ME

#拷贝并解压tomcat、jdk
ADD apache-tomcat-9.0.8-deployer.tar.gz $WORK_HOME
ADD jdk-8u321-linux-x64.tar.gz $WORK_HOME

#设置java环境变量
ENV JAVA_HOME $WORK_HOME/jdk1.8.0_191
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV TOMCAT_HOME $WORK_HOME/apache-tomcat-9.0.16
ENV PATH $PATH:$JAVA_HOME/bin:$TOMCAT_HOME/bin:$TOMCAT_HOME/lib

#覆盖tomcat的几个配置文件，增加tomcat的控制台管理界面等（演示用）
COPY tomcat-files/conf/web.xml $TOMCAT_HOME/conf/web.xml
COPY tomcat-files/conf/tomcat-users.xml $TOMCAT_HOME/conf/tomcat-users.xml
COPY tomcat-files/webapps/manager/META-INF/context.xml $TOMCAT_HOME/webapps/manager/META-INF/context.xml
COPY tomcat-files/webapps/host-manager/META-INF/context.xml $TOMCAT_HOME/webapps/host-manager/META-INF/context.xml

#默认端口开放
EXPOSE 8080

#运行命令
CMD ["catalina.sh", "run"]
