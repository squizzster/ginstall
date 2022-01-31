#!/bin/sh
echo "One moment...."
sleep 1
for (( c=1; c<=500; c++ ))
do  
   echo "
"
done
cd /root
BASEDIR=$(pwd)

if test "$BASEDIR" != '/root'; then
  echo "I am NOT in /root which is where I want to be.  Check I am running as root";
  exit;
fi

echo 'V1.0
' 
echo 'CiAgICAgICAgICAgICAgICAgICAgLiAgICwtIFRvIHRoZSBNb29uIE1hcmsgIQogICAgICAgICAgICAgICAgICAgLicuCiAgICAgICAgICAgICAgICAgICB8b3wKICAgICAgICAgICAgICAgICAgLidvJy4KICAgICAgICAgICAgICAgICAgfC4tLnwKICAgICAgICAgICAgICAgICAgJyAgICcKICAgICAgICAgICAgICAgICAgICggKQogICAgICAgICAgICAgICAgICAgICkKICAgICAgICAgICAgICAgICAgICggKQoKICAgICAgICAgICAgICAgX19fXwogICAgICAgICAgLi0nIiJwIDhvIiJgLS4KICAgICAgIC4tJzg4ODhQJ1kuYFlbICcgYC0uCiAgICAgLCddODg4ODhiLko4b29fICAgICAgJ2AuCiAgICwnICw4ODg4ODg4ODg4OFsiICAgICAgICBZYC4KICAvICAgODg4ODg4ODg4OFAgICAgICAgICAgICBZOFwKIC8gICAgWTg4ODg4ODhQJyAgICAgICAgICAgICBdODhcCjogICAgIGBZODgnICAgUCAgICAgICAgICAgICAgYDg4ODoKOiAgICAgICBZOC5vUCAnLSA+ICAgICAgICAgICAgWTg4Ogp8ICAgICAgICAgIGBZYiAgX18gICAgICAgICAgICAgYCd8CjogICAgICAgICAgICBgJ2Q4ODg4Ym8uICAgICAgICAgIDoKOiAgICAgICAgICAgICBkODg4ODg4ODhvb28uICAgICAgOwogXCAgICAgICAgICAgIFk4ODg4ODg4ODg4OFAgICAgIC8KICBcICAgICAgICAgICAgYFk4ODg4ODg4OFAgICAgIC8KICAgYC4gICAgICAgICAgICBkODg4ODhQJyAgICAsJwogICAgIGAuICAgICAgICAgIDg4OFBQJyAgICAsJwogICAgICAgYC0uICAgICAgZDhQJyAgICAsLScgICAtZy1Cb29raW5nLQogICAgICAgICAgYC0uLCxfJ19fLCwuLScKCgogICAgICAgVEhVTkRFQklSRFMgQVJFIEdPISEK' | base64 -d
[ -f /etc/redhat-release ] && echo "" || exit 
[ -d "/gbooking" ] && echo "g-booking directory exists...I am aborting so you can have a rethink." || echo "              LIFT"
[ -d "/gbooking" ] && exit
[ -d "/var/lib/mysql" ] && echo "g-booking /var/lib/mysql exists ...I am aborting so you can have a rethink." || echo "              OFF!"
[ -d "/var/lib/mysql" ] && exit
rm -f `find /var/log -type f`
[ -f /var/log/messages ] && echo "" || echo "/var/log/messages exists and really I should of just deleted it."

sleep 1
echo "


";
sleep 2

echo "Installing EPL release..."
dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm >/root/install.log 2>/root/install.err
dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm >/root/install.log 2>/root/install.err

echo "Installing Percona RPM..."
dnf -y install https://repo.percona.com/yum/percona-release-latest.noarch.rpm >/root/install.log 2>/root/install.err

echo "Installing config manager..."
dnf -y config-manager --set-enabled powertools >>/root/install.log 2>>/root/install.err
dnf -y config-manager --set-enabled powertools >>/root/install.log 2>>/root/install.err
subscription-manager repos --enable codeready-builder-for-rhel-8-x86_64-rpms >>/root/install.log 2>>/root/install.err

echo "Disable postgres module"
dnf -y module disable postgresql >>/root/install.log 2>>/root/install.err

echo "Adding Postgres GIS rep"
dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm >>/root/install.log 2>>/root/install.err
export PATH=/usr/pgsql-12/bin:$PATH

#echo "Installing PostGres GIS"
#dnf -y install postgresql12-server postgresql12-contrib  postgresql12-devel postgis30_12 >>/root/install.log 2>>/root/install.err

echo "Installing Boost Build"
dnf -y install boost-build >>/root/install.log 2>>/root/install.err

echo "Percona release setp..."
percona-release setup -y ps80

### stuff here cannot fail....
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

####curl -s -L https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash

## don't think we need this and it takes up resource
echo "Upgrading server..."
dnf -y upgrade >>/root/install.log 2>>/root/install.err

### We install MariaDB from our own RPM now....
#mariadb mariadb-common mariadb-devel mariadb-server mariadb-server-galera mariadb-server-utils 

echo "Installing modules..."
dnf -y install net-tools firewalld gcc gcc-c++ make openssl-devel git libdb-devel openssl-devel rclone libaio libsepol lsof boost-program-options mod_ssl redis  memcached.x86_64 libmemcached.x86_64 libmemcached-libs.x86_64 systemd-devel systemd-libs cpan traceroute telnet sysbench libpng-devel zlib-devel  libgcrypt libgcrypt-devel compat-libpthread-nonshared bzip2 google-authenticator qrencode-libs bind-utils ncdu nodejs libsecret-devel gnupg1.x86_64 scl-utils gcc-toolset-9 git cmake3 zlib-devel boost-devel boost boost-devel glpk glpk-devel nload wget chrony firewalld tar bind-utils.x86_64 policycoreutils-python-utils curl kpatch  percona-server-server percona-server-client percona-xtrabackup-80 percona-toolkit percona-mysql-shell pmm-client libuv-devel >>/root/install.log 2>>/root/install.err

##dnf -y install percona-server-server percona-server-client percona-xtrabackup-80 percona-toolkit percona-mysql-shell pmm-client

#wget ftp://ftp.pbone.net/mirror/ftp.centos.org/8.4.2105/PowerTools/x86_64/os/Packages/asio-devel-1.10.8-7.module_el8.3.0+757+d382997d.x86_64.rpm
#dnf -y install asio-devel-1.10.8-7.module_el8.3.0+757+d382997d.x86_64.rpm
#rm -f asio-devel-1.10.8-7.module_el8.3.0+757+d382997d.x86_64.rpm

## removed an error from Amazon and other tight big boy builds... something to do with they use SSSD and we've disabled that.
## all authentication is done locally and we have our own centralised security system
authselect select minimal with-silent-lastlog --force >>/root/install.log 2>>/root/install.err 

echo "Configuring firewall..."
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

echo "Enabling the firewall...."
systemctl enable firewalld >>/root/install.log 2>>/root/install.err
systemctl restart firewalld >>/root/install.log 2>>/root/install.err

echo "Patching the kernel...."
dnf -y kpatch auto      >>/root/install.log 2>>/root/install.err
systemctl enable kpatch >>/root/install.log 2>>/root/install.err
systemctl start kpatch  >>/root/install.log 2>>/root/install.err

echo "Setting timezone to UTC"
timedatectl set-timezone UTC >>/root/install.log 2>>/root/install.err

echo "Enabling time keeping"
systemctl enable chronyd >>/root/install.log 2>>/root/install.err

echo "Starting chronyd"
systemctl start chronyd >>/root/install.log 2>>/root/install.err
cd /root

#echo "Downloading gDrive Down Tool"
#### Our Gdrive DOWNLOAD tool
#curl -s -L https://github.com/squizzster/ginstall/raw/master/gdown.pl >/usr/local/bin/gdown.pl 2>>/root/install.err
#chmod 555 /usr/local/bin/gdown.pl 

#echo "Download MariaDB 10.6.5 from our own webserver."
#rm -f mariadb-10.*.tar
#wget --read-timeout=30 --tries=10  --quiet https://agitated-ramanujan-4baf2c.netlify.app/mariadb-10.6.5-rhel-8-x86_64-rpms.tar 2>>/root/install.err

#####wget https://storage.googleapis.com/g-booking-install/mariadb-10.6.5-rhel-8-x86_64-rpms.tar  >>/root/install.log 2>>/root/install.err

#echo "Extracting MariaDB...."
#cd /opt
#tar -xf /root/mariadb-10.6.5-rhel-8-x86_64-rpms.tar >>/root/install.log 2>>/root/install.err
#/opt/mariadb-10.6.5-rhel-8-x86_64-rpms/setup_repository >>/root/install.log 2>>/root/install.err
#rm -f /root/mariadb-10.6.5-rhel-8-x86_64-rpms.tar >>/root/install.log 2>>/root/install.err
#echo "Installing MariaDB"
#dnf -y install MariaDB-server MariaDB-common MariaDB-s3-engine MariaDB-devel MariaDB-backup MariaDB >>/root/install.log 2>>/root/install.err

### Need to check error messsage and then actually decide what to do otherwise just x 2 chances of exiting the script but we dont have one of those

#echo "Updating system"
#systemctl enable mariadb >>/root/install.log 2>>/root/install.err
#systemctl start mariadb >>/root/install.log 2>>/root/install.err
#echo "Adding mysql_upgrade";
#nohup mysql_upgrade >>/root/install.log 2>>/root/install.err &

#sleep 20;

#echo "Securing mysql"
#echo 'RFJPUCBEQVRBQkFTRSBJRiBFWElTVFMgdGVzdDsKREVMRVRFIEZST00gbXlzcWwudXNlciBXSEVSRSBVc2VyPSdyb290JyBBTkQgSG9zdCBOT1QgSU4gKCdsb2NhbGhvc3QnLCAnMTI3LjAuMC4xJywgJzo6MScpOwpERUxFVEUgRlJPTSBteXNxbC51c2VyIFdIRVJFIFVzZXI9Jyc7CkRFTEVURSBGUk9NIG15c3FsLmRiIFdIRVJFIERiPSd0ZXN0JyBPUiBEYj0ndGVzdFxfJSc7CkZMVVNIIFBSSVZJTEVHRVM7Cgo=' | base64 -d | mysql >>/root/install.log 2>>/root/install.err

echo "Starting SQL"
systemctl enable mysqld >>/root/install.log 2>>/root/install.err
systemctl start  mysqld >>/root/install.log 2>>/root/install.err

echo "Adding SQL password";
>/root/.mysql_temporary.secret
>/root/.mysql_root.secret
chmod 000 /root/.mysql_temporary.secret
chmod 000 /root/.mysql_root.secret

SQL_PASSWD=$(grep "temporary password" /var/log/mysqld.log | sed 's/.*localhost: \|//')
echo $SQL_PASSWD >>/root/.mysql_temporary.secret

SQL_NEW=$(openssl rand -base64 32)
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_NEW'" | mysql --connect-expired-password --user=root --password="$(cat /root/.mysql_temporary.secret)" >>/root/install.log 2>>/root/install.err

echo $SQL_NEW >>/root/.mysql_root.secret
rm -f /root/.mysql_temporary.secret

echo "Adding SQL zones";
mysql_tzinfo_to_sql /usr/share/zoneinfo  2>>/root/install.err | mysql --connect-expired-password  -u root -D mysql --password="$(cat /root/.mysql_root.secret)" >>/root/install.log 2>>/root/install.err
#mysql_tzinfo_to_sql /usr/share/zoneinfo  2>>/root/install.err | mysql --connect-expired-password  -u root -D mysql --password='$SQL_NEW' >>/root/install.log 2>>/root/install.err
#mysql_tzinfo_to_sql /usr/share/zoneinfo 2>>/root/install.err | mysql -u root mysql >>/root/install.log 2>>/root/install.err


cd /root
echo "Configuring SSH..."
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

echo "Installing node_checker..."
curl -s -L https://github.com/squizzster/ginstall/raw/master/node_checker >/usr/local/bin/node_checker 2>>/root/install.err
chmod 100 /usr/local/bin/node_checker
echo '[Unit]
Description = g-Booking Node Checker. Every minute I check-in with central command.

[Service]
Type = notify
ExecStart = /usr/local/bin/perl /usr/local/bin/node_checker
ExecReload = /bin/kill -HUP $MAINPID
WatchdogSec = 180
TimeoutSec  = 400

[Install]
WantedBy=multi-user.target
' >/etc/systemd/system/node_checker.service 

####firewall-cmd --permanent --zone=public --add-port=5000/tcp

echo "Adding OSRM user with /sbin/nologin"
adduser osrm -s /sbin/nologin 2>>/root/install.err || true

echo '[Unit]
Description=g-Booking Routing Machine
Wants=network-online.target
After=network.target network-online.target

[Service]
ExecStart=/usr/local/bin/osrm-routed --algorithm=MLD --max-table-size=10000  /gbooking/g-booking-server/osrm/britain-and-ireland-latest.osrm
User=osrm
Group=osrm
Restart=always
RestartSec=5s

[Install]
WantedBy=multi-user.target
' >/etc/systemd/system/osrm_routed.service


systemctl daemon-reload  >>/root/install.log 2>>/root/install.err
systemctl enable node_checker >>/root/install.log 2>>/root/install.err

cd /

echo "Installing perl...";
curl -s -L https://github.com/squizzster/ginstall/raw/master/install_perl-5.34.0.tar.gz | tar -zx >>/root/install.log 2>>/root/install.err
echo "Installing CPAN...";
curl -s -L https://github.com/squizzster/ginstall/raw/master/cpan_only_modules_03_11_21.tar.gz | tar -zx >>/root/install.log 2>>/root/install.err
curl -s -L https://github.com/squizzster/ginstall/raw/master/cpan_only_modules_05_11_21.tar.gz | tar -zx >>/root/install.log 2>>/root/install.err
curl -s -L https://github.com/squizzster/ginstall/raw/master/cpan_only_modules_07_11_21.tar.gz | tar -zx >>/root/install.log 2>>/root/install.err


#systemctl stop mariadb >>/root/install.log 2>>/root/install.err
#systemctl disable mariadb >>/root/install.log 2>>/root/install.err

echo "Removing unused daemons like sssd-client and polkit"
dnf -y remove polkit sssd-client  sssd-common  sssd-kcm   sssd-nfs-idmap  >>/root/install.log 2>>/root/install.err

echo "Stopping SQL before final reboot"
systemctl stop mysqld >>/root/install.log 2>>/root/install.err

echo "ALL DONE!"

echo "

  rebooting in 1 minute...
  rebooting in 1 minute...
  rebooting in 1 minute...
  rebooting in 1 minute...

     use shutdown -c

to cancel.

"

rm -f /root/gdown*

shutdown -r +1

