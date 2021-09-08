#!/bin/bash
set -e
##########################################
#  g-booking server installation script  #
##########################################
trap 'catch $? $LINENO' EXIT
catch() {
  if [ "$1" != "0" ]; then
    # error handling goes here
    echo "Error $1 occurred on $2"
  fi
}
dnf -y install wget chrony firewalld tar bind-utils.x86_64
EIP=`dig emergency.g-booking.com +short`
echo -n '<?xml version="1.0" encoding="utf-8"?>
<zone target="DROP">
  <short>Public</short>
  <description>For use in public areas. You do not trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted.</description>

 <rule family="ipv4">
    <source address="' >/etc/firewalld/zones/public.xml

echo -n $EIP >>/etc/firewalld/zones/public.xml
echo -n '"/>
    <port port="22" protocol="tcp"/>
    <accept/>
  </rule>
</zone>
' >>/etc/firewalld/zones/public.xml

systemctl enable firewalld
systemctl start firewalld

cd /root
BASEDIR=$(pwd)

if test "$BASEDIR" != '/root'; then
  echo "I am NOT in /root which is where I want to be.  Check I am running as root";
  exit;
fi


[ -f /etc/redhat-release ] && echo "" || exit 

echo "g-Booking server installation started
";

[ -d "/gbooking" ] && echo "g-booking directory exists...I am aborting so you can have a rethink." || echo "Thunderbirds are GO!"
[ -d "/gbooking" ] && exit

systemctl enable chronyd
systemctl start chronyd
timedatectl set-timezone UTC
cd /root
rm -rf cpan* perl* ccrypt*

echo "Fetching scripts and data files..."
wget -c https://github.com/squizzster/ginstall/raw/master/cpan.tar 
wget -c https://gitlab.com/g-booking/g-install/-/raw/master/cpan.tar

wget -c https://github.com/squizzster/ginstall/raw/54e2edb69bf99e064714a8202088d54dbba9b5de/perl-5.34.0.tar.gz
wget -c https://github.com/squizzster/ginstall/raw/master/ccrypt-1.11.tar.gz
wget -c https://github.com/squizzster/ginstall/raw/master/install_cpan.pl 
wget -c https://github.com/squizzster/ginstall/raw/master/encode_decode
wget -c https://curl.se/download/curl-7.77.0.tar.gz

echo "Installing encode_decode"
mv /root/encode_decode /usr/local/bin
chmod 555 /usr/local/bin/encode_decode

echo "Updating system"

dnf -y upgrade
dnf -y update 

dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf -y config-manager --set-enabled powertools

curl -L https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash

dnf -y install firewalld gcc gcc-c++ make openssl-devel git libdb-devel openssl-devel rclone libaio libsepol lsof boost-program-options MariaDB-server MariaDB-client mod_ssl redis mysql-devel memcached.x86_64 libmemcached.x86_64 libmemcached-libs.x86_64 systemd-devel systemd-libs cpan traceroute telnet sysbench libpng-devel zlib-devel  libgcrypt libgcrypt-devel compat-libpthread-nonshared bzip2 google-authenticator qrencode-libs bind-utils

## Postgres not used at moment
##dnf -y install postgresql perl-pgsql_perl5 pg_top perl-DBD-Pg postgresql-contrib java-11-openjdk 


systemctl enable mariadb
systemctl start mariadb
echo "Adding mysql";
nohup mysql_upgrade &
#mysql_secure_installation
sleep 20;
echo "Adding zones";
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root mysql
systemctl stop mariadb
systemctl disable mariadb
systemctl enable firewalld 


# Update curl as early versions have security issues.  Maybe, probably... could be... but do it anyway.
tar -xf curl-7.77.0.tar.gz
cd curl-7.77.0
./configure --with-openssl
make
make install
cd ..
ln -f /usr/local/bin/curl /usr/bin/curl


gzip -fd ccrypt-1.11.tar.gz
tar -xf ccrypt-1.11.tar
cd ./ccrypt-1.11
./configure
make
make install
cd ..

gzip -d perl-5.34.0.tar.gz
tar -xf perl-5.34.0.tar
cd perl-5.34.0

sh Configure -de

make
##make test  ### PRODUCTION
make install

curl -L https://github.com/squizzster/ginstall/raw/master/cpanminus.pl | perl - App::cpanminus

mkdir -p /gbooking/g-booking-server/install/cpan
cd       /gbooking/g-booking-server/install/cpan

tar -xf  /root/cpan.tar
rm -f    /root/cpan.tar

curl -L https://github.com/squizzster/ginstall/raw/master/install_cpan.pl | perl 

cd /root

#wget https://apache.mirrors.nublue.co.uk/kafka/2.8.0/kafka_2.13-2.8.0.tgz
#tar -xf kafka_2.13-2.8.0.tgz
#mv kafka_2.13-2.8.0 /usr/local/kafka
#echo '[Unit]
#Description=Apache Zookeeper server
#Documentation=http://zookeeper.apache.org
#Requires=network.target remote-fs.target
#After=network.target remote-fs.target
#
#[Service]
#Type=simple
#ExecStart=/usr/bin/bash /usr/local/kafka/bin/zookeeper-server-start.sh /usr/local/kafka/config/zookeeper.properties
#ExecStop=/usr/bin/bash /usr/local/kafka/bin/zookeeper-server-stop.sh
#Restart=on-abnormal
#
#[Install]
#WantedBy=multi-user.target' >/etc/systemd/system/zookeeper.service
#
#echo '[Unit]
#Description=Apache Kafka Server
#Documentation=http://kafka.apache.org/documentation.html
#Requires=zookeeper.service
#
#[Service]
#Type=simple
#Environment="JAVA_HOME=/usr/lib/jvm/jre-11-openjdk"
#ExecStart=/usr/bin/bash /usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties
#ExecStop=/usr/bin/bash /usr/local/kafka/bin/kafka-server-stop.sh
#
#[Install]
#WantedBy=multi-user.target' >/etc/systemd/system/kafka.service
#
##systemctl daemon-reload
##systemctl enable zookeeper
##systemctl enable kafka
##systemctl start zookeeper
##systemctl start kafka
#sudo tee /etc/yum.repos.d/rabbitmq_erlang.repo<<EOF
#[rabbitmq_erlang]
#name=rabbitmq_erlang
#baseurl=https://packagecloud.io/rabbitmq/erlang/el/8/x86_64
#repo_gpgcheck=1
#gpgcheck=1
#enabled=1
## PackageCloud's repository key and RabbitMQ package signing key
#gpgkey=https://packagecloud.io/rabbitmq/erlang/gpgkey
       #https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc
#sslverify=1
#sslcacert=/etc/pki/tls/certs/ca-bundle.crt
#metadata_expire=300
#
#[rabbitmq_erlang-source]
#name=rabbitmq_erlang-source
#baseurl=https://packagecloud.io/rabbitmq/erlang/el/8/SRPMS
#repo_gpgcheck=1
#gpgcheck=0
#enabled=1
## PackageCloud's repository key and RabbitMQ package signing key
#gpgkey=https://packagecloud.io/rabbitmq/erlang/gpgkey
       #https://dl.bintray.com/rabbitmq/Keys/rabbitmq-release-signing-key.asc
#sslverify=1
#sslcacert=/etc/pki/tls/certs/ca-bundle.crt
#metadata_expire=300
#EOF
#
#sudo yum clean all
#sudo yum -y makecache
#
#curl -s https://packagecloud.io/install/repositories/rabbitmq/rabbitmq-server/script.rpm.sh | sudo bash
#dnf makecache -y --disablerepo='*' --enablerepo='rabbitmq_rabbitmq-server'
#dnf -y install --nogpgcheck erlang
#dnf -y install rabbitmq-server
#
##systemctl enable --now rabbitmq-server.service
#
#
#
#
#
#
#
#
### OK, some final task..
echo '##### gbooking v1.0 ######
HostKey /etc/ssh/ssh_host_ed25519_key

SyslogFacility AUTHPRIV
LogLevel INFO

StrictModes yes

LoginGraceTime 15
PermitRootLogin yes
MaxAuthTries 1
MaxSessions 5
PermitRootLogin without-password
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys
PasswordAuthentication no
PermitEmptyPasswords no
TCPKeepAlive yes
#Banner none

ChallengeResponseAuthentication yes
KerberosAuthentication no
GSSAPIAuthentication no
PubkeyAcceptedKeyTypes ssh-ed25519

UsePAM yes

X11Forwarding no
PrintMotd yes

PermitUserEnvironment no
AllowAgentForwarding no
AllowTcpForwarding no
PermitTunnel no
' >/etc/ssh/sshd_config

mkdir -p /root/.ssh
echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMF5PmJ+ma3VLnPWsGctt+MSxd8l1Cfzz27E/Em2xSe2 root@g-booking.com' >/root/.ssh/authorized_keys

curl -L https://github.com/squizzster/ginstall/raw/master/node_checker >node_checker
chmod 100 node_checker
echo '[Unit]
Description = g-Booking Node Checker. Every minute I check-in with central command.

[Service]
Type = notify
ExecStart = /usr/local/bin/perl /root/node_checker
ExecReload = /bin/kill -HUP $MAINPID
WatchdogSec = 180
TimeoutSec  = 400

[Install]
WantedBy=multi-user.target
' >/etc/systemd/system/node_checker.service 
systemctl daemon-reload
systemctl enable node_checker

cd /root

#wget https://www.openssl.org/source/openssl-1.1.1k.tar.gz
#tar -xf openssl-1.1.1k.tar.gz
#rm openssl-1.1.1k.tar.gz
#cd openssl-*
#./config --prefix=/usr/local/ssl --openssldir=/usr/local/ssl shared zlib
#make
#make test
#make install

#cd /root






rm -rf c* p* /root/.cpan* /gbooking *.sh std* original* noh* ins* /tmp/* 
>/var/log/messages
>/var/log/secure
>/var/log/firewalld

echo "

rebooting in 1 minute... 
rebooting in 1 minute... 
rebooting in 1 minute... 
rebooting in 1 minute... 

     use shutdown -c    

to cancel.

"
shutdown -r +1
 
