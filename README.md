# RPM demo

This project is a demo project, to show how to use rpm-maven-plugin to generate a RPM for a SpringBoot java project.

## Build the RPM

> If you use a redhat based linux, you need the commands __rpm__ and __rpmbuild__.
>
> If you are running another operative system, or don't want to install stuff, you can use the provided Docker or Vagrant based environment.

### On a RedHat based linux

You need to install Oracle JDK (= 1.8.0_112), and rpmbuild. Then, you can run Maven wrapper command.

    $ ./mvnw package rpm:rpm

The RPM is generated in target/rpm/rpm-demo/RPMS/noarch.

### Using Docker

All the needed stuff (OracleJDK, rpmbuild) is manage by the Dockerfile.

    $ docker build . -t rpmdemo
    $ docker run --rm -v$PWD:/project -it rpmdemo

### Using Vagrant

All the needed stuff (OracleJDK, rpmbuild) is manage by the Vagrantfile.

    $ vagrant up

## Test the RPM

> In the Docker or Vagrant environment, you have to change directory to /project.

    $ yum -y localinstall target/rpm/rpm-demo/RPMS/noarch/rpm-demo-*.noarch.rpm
    $ java -jar /var/rpmdemo/rpmdemo.jar
