add-apt-repository ppa:openjdk-r/ppa -y
apt-get update
apt-get install unzip
apt-get install -y vim
apt-get install netstat

echo "\n----- Installing Apache and Java 7 ------\n"
#add-apt-repository ppa:openjdk-r/ppa -y
apt-get -y install apache2 openjdk-7-jdk
update-alternatives --config java
