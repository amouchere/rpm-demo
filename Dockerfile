FROM centos:7
MAINTAINER RPM Demo team

RUN yum -y install rpm-build &&\
 yum clean all

ENV MAJOR_VERSION=8
ENV MINOR_VERSION=112
ENV BUILD_VERSION=15

RUN curl --output /tmp/jdk-${MAJOR_VERSION}u${MINOR_VERSION}-linux-x64.rpm\
 -sSL -H "Cookie:oraclelicense=accept-securebackup-cookie"\
 http://download.oracle.com/otn-pub/java/jdk/${MAJOR_VERSION}u${MINOR_VERSION}-b${BUILD_VERSION}/jdk-${MAJOR_VERSION}u${MINOR_VERSION}-linux-x64.rpm &&\
 yum -y localinstall /tmp/jdk-${MAJOR_VERSION}u${MINOR_VERSION}-linux-x64.rpm &&\
 rm -f /tmp/jdk-${MAJOR_VERSION}u${MINOR_VERSION}-linux-x64.rpm

ENV JAVA_HOME=/usr/java/jdk1.${MAJOR_VERSION}.0_${MINOR_VERSION}

# Expose application default port
EXPOSE 8080

VOLUME /project
WORKDIR /project

CMD ["/project/mvnw", "clean", "package", "rpm:rpm"]
