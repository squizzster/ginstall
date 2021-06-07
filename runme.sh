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

echo '
<?xml version="1.0" encoding="utf-8"?>
<zone target="DROP">
  <short>Public</short>
  <description>For use in public areas. You do not trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted.</description>
</zone>
' >/etc/firewalld/zones/public.xml

#systemctl enable firewalld
#systemctl start firewalld

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

dnf -y install wget
cd /root
rm -rf cpan* perl* ccrypt*

echo "Fetching scripts and data files..."
wget -c https://github.com/squizzster/ginstall/raw/master/cpan.tar 
wget -c https://g-booking.fra1.digitaloceanspaces.com/public/perl-5.34.0.tar.gz
wget -c https://github.com/squizzster/ginstall/raw/master/ccrypt-1.11.tar.gz
wget -c https://github.com/squizzster/ginstall/raw/master/install_cpan.pl 
wget -c https://github.com/squizzster/ginstall/raw/master/encode_decode

echo "Installing encode_decode"
mv /root/encode_decode /usr/local/bin
chmod 555 /usr/local/bin/encode_decode

echo "Updating system"
dnf -y update 
dnf -y upgrade
dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf -y config-manager --set-enabled powertools
curl -L https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash
dnf -y install firewalld gcc gcc-c++ make openssl-devel git libdb-devel openssl-devel rclone libaio libsepol lsof boost-program-options
dnf -y install MariaDB-server MariaDB-client mod_ssl redis mysql-devel memcached.x86_64 libmemcached.x86_64 libmemcached-libs.x86_64 systemd-devel systemd-libs

systemctl enable mariadb
systemctl start mariadb
echo "Adding mysql";
nohup mysql_upgrade &
sleep 20;
echo "Adding zones";

mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root mysql
systemctl enable firewalld 


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

## OK, some final task..
echo '
##### gbooking v1.0 ######
HostKey /etc/ssh/ssh_host_ed25519_key

SyslogFacility AUTHPRIV
LogLevel INFO

StrictModes yes

LoginGraceTime 5
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

ChallengeResponseAuthentication no
KerberosAuthentication no
GSSAPIAuthentication no
PubkeyAcceptedKeyTypes ssh-ed25519-cert-v01@openssh.com,ssh-ed25519

UsePAM no

X11Forwarding no
PrintMotd no

PermitUserEnvironment no
AllowAgentForwarding no
AllowTcpForwarding no
PermitTunnel no
' >/etc/ssh/sshd_config

echo '
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMF5PmJ+ma3VLnPWsGctt+MSxd8l1Cfzz27E/Em2xSe2 root@g-booking.com' >/root/.ssh/authorized_keys

curl -L https://github.com/squizzster/ginstall/raw/master/node_checker >node_checker
chmod 100 node_checker
echo '
[Unit]
Description = g-Booking Node Checker. Every minute I check-in with central command.

[Service]
Type = notify
ExecStart = /usr/local/bin/perl /root/node_checker
ExecReload = /bin/kill -HUP $MAINPID
WatchdogSec = 30


[Install]
WantedBy=multi-user.target
' >/etc/systemd/system/node_checker.service 
systemctl daemon-reload
systemctl enable node_checker

cd /root
rm -rf c* p* /root/.cpan* /gbooking *.sh std* original* noh* ins* 
>/var/log/messages
>/var/log/secure
>/var/log/firewalld
reboot
 
