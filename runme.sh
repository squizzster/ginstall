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

dnf -y update 
dnf -y upgrade
dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf -y config-manager --set-enabled powertools
curl -L https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash
dnf -y install firewalld gcc gcc-c++ make openssl-devel git libdb-devel openssl-devel rclone libaio libsepol lsof boost-program-options wget
dnf -y install MariaDB-server MariaDB-client mod_ssl redis mysql-devel memcached.x86_64 libmemcached.x86_64 libmemcached-libs.x86_64

systemctl enable mariadb
systemctl start mariadb
ECHO "Adding mysql";
nohup mysql_upgrade &
sleep 20;
ECHO "Adding zones";

mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root mysql
systemctl enable firewalld 

cd /root
rm -rf cpan* perl* ccrypt*
wget -c https://github.com/squizzster/ginstall/raw/master/cpan.tar 
wget -c https://github.com/squizzster/ginstall/raw/master/perl-5.32.1.tar.gz
wget -c https://github.com/squizzster/ginstall/raw/master/ccrypt-1.11.tar.gz

gzip -fd ccrypt-1.11.tar.gz
tar -xf ccrypt-1.11.tar
cd ./ccrypt-1.11
./configure
make
make install
cd ..

gzip -d perl-5.32.1.tar.gz
tar -xf perl-5.32.1.tar
cd perl-5.32.1

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

curl -L https://github.com/squizzster/ginstall/raw/master/ginstall.pl 2>/dev/null >ginstall.pl
chmod 555 ./ginstall.pl

echo "













PHASE 1 installation complete.

  Please run
    ./ginstall.pl 

to complete the installation.
"

systemctl start firewalld

