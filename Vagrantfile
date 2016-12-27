# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.provision "shell", inline: <<-SHELL
    export MAJOR_VERSION=8
    export MINOR_VERSION=112
    export BUILD_VERSION=15
    yum -y install rpm-build curl\
     && curl --output /tmp/jdk-${MAJOR_VERSION}u${MINOR_VERSION}-linux-x64.rpm\
     -sSL -H "Cookie:oraclelicense=accept-securebackup-cookie"\
     http://download.oracle.com/otn-pub/java/jdk/${MAJOR_VERSION}u${MINOR_VERSION}-b${BUILD_VERSION}/jdk-${MAJOR_VERSION}u${MINOR_VERSION}-linux-x64.rpm\
     && yum -y localinstall /tmp/jdk-${MAJOR_VERSION}u${MINOR_VERSION}-linux-x64.rpm\
     && rm -f /tmp/jdk-${MAJOR_VERSION}u${MINOR_VERSION}-linux-x64.rpm\
     && yum clean all
  SHELL
end
