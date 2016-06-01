FROM ubuntu
MAINTAINER AEEC

# Fix sh
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install dependencies
RUN apt-get update && \
apt-get install -y git build-essential curl wget software-properties-common

# Install Java
RUN apt-get install -y  software-properties-common && \
    add-apt-repository ppa:webupd8team/java -y && \
    apt-get update && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get install -y oracle-java7-installer && \
    apt-get clean

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle


RUN apt-get install -y nodejs npm git git-core
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN mkdir /app
WORKDIR /app
RUN  npm install -g bower
RUN  npm install -g grunt-cli
RUN echo "Executing npm install"
RUN mkdir node_modules
COPY package.json .
RUN  npm install
COPY . /app
RUN echo "Executing bower install"
COPY bower.json .
RUN  bower install --allow-root
RUN  grunt build
#RUN  grunt war

# Get Tomcat
RUN wget --quiet --no-cookies http://archive.apache.org/dist/tomcat/tomcat-7/v7.0.69/bin/apache-tomcat-7.0.69.tar.gz -O /tmp/tomcat.tgz && \
tar xzvf /tmp/tomcat.tgz -C /opt && \
mv /opt/apache-tomcat-7.0.69 /opt/tomcat && \
rm /tmp/tomcat.tgz && \
rm -rf /opt/tomcat/webapps/examples && \
rm -rf /opt/tomcat/webapps/docs && \
rm -rf /opt/tomcat/webapps/ROOT && \
mkdir ROOT && \
cp -R /app/dist/ /opt/tomcat/webapps/ROOT

ENV CATALINA_HOME /opt/tomcat
ENV PATH $PATH:$CATALINA_HOME/bin

EXPOSE 8080
VOLUME "/opt/tomcat/webapps"
WORKDIR /opt/tomcat

# Launch Tomcat
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
