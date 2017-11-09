add-apt-repository ppa:openjdk-r/ppa -y
apt-get update
apt-get install unzip
apt-get install -y vim
apt-get install netstat

echo "\n----- Installing Apache and Java 8 ------\n"
apt-get -y install apache2 openjdk-8-jdk
update-alternatives --config java

