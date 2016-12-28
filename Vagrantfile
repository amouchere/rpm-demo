# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  # Expose application default port
  config.vm.network "forwarded_port", guest: 8080, host: 8080

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder ".", "/project", type: "rsync",
    rsync__exclude: [".git/", ".idea/"]

  config.vm.provision "shell", inline: <<-SHELL
    export MAJOR_VERSION=8
    export MINOR_VERSION=112
    export BUILD_VERSION=15
    yum -y install rpm-build curl \
    && curl --output /tmp/jdk-${MAJOR_VERSION}u${MINOR_VERSION}-linux-x64.rpm \
    -sSL -H "Cookie:oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/${MAJOR_VERSION}u${MINOR_VERSION}-b${BUILD_VERSION}/jdk-${MAJOR_VERSION}u${MINOR_VERSION}-linux-x64.rpm \
    && yum -y localinstall /tmp/jdk-${MAJOR_VERSION}u${MINOR_VERSION}-linux-x64.rpm \
    && rm -f /tmp/jdk-${MAJOR_VERSION}u${MINOR_VERSION}-linux-x64.rpm \
    && yum clean all \
    && cd /project \
    && ./mvnw clean package rpm:rpm
  SHELL
end
