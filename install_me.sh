#!/bin/bash

### stuff here can fail....
sleep 1
echo "g-Booking server installation started
 
";
echo "Installing EPL release..."
dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm >/root/install.log 2>/root/install.err
echo "Installing config manager..."
dnf -y config-manager --set-enabled powertools >>/root/install.log 2>>/root/install.err
echo "Removing unused daemons like sssd-client and polkit"
dnf -y remove polkit sssd-client  sssd-common  sssd-kcm   sssd-nfs-idmap mysql mysql-common mysql-devel mariadb mariadb-common mariadb-devel mariadb-server mariadb-server-galera mariadb-server-utils >>/root/install.log 2>>/root/install.err
echo "Installing Boost Build"
dnf -y install boost-build >>/root/install.log 2>>/root/install.err

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

####curl -L https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | bash

## don't think we need this and it takes up resource
echo "Performing an upgrade of everything..."
dnf -y upgrade >>/root/install.log 2>>/root/install.err
dnf -y update >>/root/install.log 2>>/root/install.err

### We install MariaDB from our own RPM now....
#mariadb mariadb-common mariadb-devel mariadb-server mariadb-server-galera mariadb-server-utils 

echo "Installing all required DNF modules..."
dnf -y install net-tools firewalld gcc gcc-c++ make openssl-devel git libdb-devel openssl-devel rclone libaio libsepol lsof boost-program-options mod_ssl redis  memcached.x86_64 libmemcached.x86_64 libmemcached-libs.x86_64 systemd-devel systemd-libs cpan traceroute telnet sysbench libpng-devel zlib-devel  libgcrypt libgcrypt-devel compat-libpthread-nonshared bzip2 google-authenticator qrencode-libs bind-utils ncdu nodejs libsecret-devel gnupg1.x86_64 scl-utils gcc-toolset-9 git cmake3 zlib-devel boost-devel boost boost-devel glpk glpk-devel nload wget chrony firewalld tar bind-utils.x86_64 curl >>/root/install.log 2>>/root/install.err


#wget ftp://ftp.pbone.net/mirror/ftp.centos.org/8.4.2105/PowerTools/x86_64/os/Packages/asio-devel-1.10.8-7.module_el8.3.0+757+d382997d.x86_64.rpm
#dnf -y install asio-devel-1.10.8-7.module_el8.3.0+757+d382997d.x86_64.rpm
#rm -f asio-devel-1.10.8-7.module_el8.3.0+757+d382997d.x86_64.rpm

## removed an error from Amazon and other tight big boy builds... something to do with they use SSSD and we've disabled that.
## all authentication is done locally and we have our own centralised security system
authselect select minimal with-silent-lastlog --force >>/root/install.log 2>>/root/install.err 

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
systemctl start firewalld >>/root/install.log 2>>/root/install.err
systemctl restart firewalld >>/root/install.log 2>>/root/install.err

cd /root
BASEDIR=$(pwd)

if test "$BASEDIR" != '/root'; then
  echo "I am NOT in /root which is where I want to be.  Check I am running as root";
  exit;
fi


[ -f /etc/redhat-release ] && echo "" || exit 


[ -d "/gbooking" ] && echo "g-booking directory exists...I am aborting so you can have a rethink." || echo "Thunderbirds are GO!"
[ -d "/gbooking" ] && exit

echo "Enabling chronyd"
systemctl enable chronyd >>/root/install.log 2>>/root/install.err
echo "Staring chronyd"
systemctl start chronyd >>/root/install.log 2>>/root/install.err
echo "Setting timezone to UTC"
timedatectl set-timezone UTC >>/root/install.log 2>>/root/install.err
cd /root
echo "Downloading gDrive Down Tool"
### Our Gdrive DOWNLOAD tool
curl -L https://github.com/squizzster/ginstall/raw/master/gdown.pl >/usr/local/bin/gdown.pl 2>>/root/install.err
chmod 555 /usr/local/bin/gdown.pl >>/root/install.log 2>>/root/install.err

echo "Getting latest MariaDB"
/usr/local/bin/gdown.pl 'https://drive.google.com/file/d/167ku817WTPSRmmWsn7T9GSzqeaKdibjq/view?usp=sharing' /root/mariadb-10.6.5-rhel-8-x86_64-rpms.tar

echo "UNtar MariaDB...."
cd /opt
tar -xf /root/mariadb-10.6.5-rhel-8-x86_64-rpms.tar >>/root/install.log 2>>/root/install.err
/opt/mariadb-10.6.5-rhel-8-x86_64-rpms/setup_repository >>/root/install.log 2>>/root/install.err
rm -f /root/mariadb-10.6.5-rhel-8-x86_64-rpms.tar >>/root/install.log 2>>/root/install.err
echo "Installing MariaDB"
dnf -y install MariaDB-server MariaDB-common MariaDB-s3-engine MariaDB-devel MariaDB-backup MariaDB >>/root/install.log 2>>/root/install.err

### Need to check error messsage and then actually decide what to do otherwise just x 2 chances of exiting the script but we dont have one of those

echo "Updating system"
systemctl enable mariadb >>/root/install.log 2>>/root/install.err
systemctl start mariadb >>/root/install.log 2>>/root/install.err
echo "Adding mysql";
nohup mysql_upgrade >>/root/install.log 2>>/root/install.err &

sleep 20;

echo 'RFJPUCBEQVRBQkFTRSBJRiBFWElTVFMgdGVzdDsKREVMRVRFIEZST00gbXlzcWwudXNlciBXSEVSRSBVc2VyPSdyb290JyBBTkQgSG9zdCBOT1QgSU4gKCdsb2NhbGhvc3QnLCAnMTI3LjAuMC4xJywgJzo6MScpOwpERUxFVEUgRlJPTSBteXNxbC51c2VyIFdIRVJFIFVzZXI9Jyc7CkRFTEVURSBGUk9NIG15c3FsLmRiIFdIRVJFIERiPSd0ZXN0JyBPUiBEYj0ndGVzdFxfJSc7CkZMVVNIIFBSSVZJTEVHRVM7Cgo=' | base64 -d | mysql >>/root/install.log 2>>/root/install.err

echo "Adding zones";
mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -u root mysql >>/root/install.log 2>>/root/install.err
systemctl enable firewalld  >>/root/install.log 2>>/root/install.err

cd /root
echo "Final tasks....."
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

curl -L https://github.com/squizzster/ginstall/raw/master/node_checker >node_checker 2>>/root/install.err
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

systemctl daemon-reload  >>/root/install.log 2>>/root/install.err
systemctl enable node_checker >>/root/install.log 2>>/root/install.err

cd /

curl -L https://github.com/squizzster/ginstall/raw/master/install_perl-5.34.0.tar.gz | tar -zx >>/root/install.log 2>>/root/install.err
curl -L https://github.com/squizzster/ginstall/raw/master/cpan_only_modules_03_11_21.tar.gz | tar -zx >>/root/install.log 2>>/root/install.err
curl -L https://github.com/squizzster/ginstall/raw/master/cpan_only_modules_05_11_21.tar.gz | tar -zx >>/root/install.log 2>>/root/install.err
curl -L https://github.com/squizzster/ginstall/raw/master/cpan_only_modules_07_11_21.tar.gz | tar -zx >>/root/install.log 2>>/root/install.err

rm -f `find /var/log -type f`
rm -f /root/nohup.out

systemctl stop mariadb >>/root/install.log 2>>/root/install.err
systemctl disable mariadb >>/root/install.log 2>>/root/install.err

echo "ALL DONE!"

echo "

  rebooting in 1 minute...
  rebooting in 1 minute...
  rebooting in 1 minute...
  rebooting in 1 minute...

     use shutdown -c

to cancel.

"
shutdown -r +1
sleep 55

sleep 20
reboot

