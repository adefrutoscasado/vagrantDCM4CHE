

# VagrantDCM4CHE
A Vagrant with Ubuntu + DCM4CHE + MySQL.

:warning: Memory is set to use 2 GB of your PC. For own experience it should be >500 MB.

### Installation
Start the virtual machine
```sh
vagrant up
```
After that, connect with the machine
```sh
vagrant ssh
```
Execute the following command
```sh
sudo apt-get install mysql-server-5.5
```
Login MySQL
```sh
mysql -u root -p
```
In MySQL, execute:
```sh
mysql> create schema pacsdb;
mysql> grant all on pacsdb.* to pacs@localhost identified by 'pacs';
mysql> flush privileges;
mysql> exit;
```
Continue executing in vagrant:
```sh
cd /vagrant
wget "https://sourceforge.net/projects/jboss/files/JBoss/JBoss-4.2.3.GA/jboss-4.2.3.GA-jdk6.zip"
unzip jboss-4.2.3.GA-jdk6.zip
wget "https://sourceforge.net/projects/dcm4che/files/dcm4chee/2.18.0/dcm4chee-2.18.0-mysql.zip"
unzip dcm4chee-2.18.0-mysql.zip

cd /vagrant
wget http://download.java.net/media/jai-imageio/builds/release/1.1/jai_imageio-1_1-lib-linux-amd64.tar.gz
tar xzvf jai_imageio-1_1-lib-linux-amd64.tar.gz

cd /vagrant
cp jai_imageio-1_1/lib/libclib_jiio.so dcm4chee-2.18.0-mysql/bin/native/libclib_jiio.so

cd /vagrant/dcm4chee-2.18.0-mysql/bin/  
./install_jboss.sh /vagrant/jboss-4.2.3.GA

cd /vagrant/dcm4chee-2.18.0-mysql/sql/ 
mysql -upacs -ppacs pacsdb < create.mysql

cd /  
sudo mv /vagrant/dcm4chee-2.18.0-mysql/ /opt/ 
sudo ln -s /opt/dcm4chee-2.18.0-mysql /opt/dcm4chee

sudo useradd dcm4chee
sudo chown -R dcm4chee /opt/dcm4chee-2.18.0-mysql

sudo su - dcm4chee -c /opt/dcm4chee/bin/run.sh
```

Go to http://localhost:8080/dcm4chee-web3 in you browser and login with admin/admin
