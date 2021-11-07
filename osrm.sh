#!/bin/bash

mkdir /gbooking
cd /gbooking

dnf -y install scl-utils gcc-toolset-9 git cmake3 zlib-devel boost-devel
dnf -y install boost boost-devel boost-build
dnf -y install glpk glpk-devel
wget ftp://ftp.pbone.net/mirror/ftp.centos.org/8.4.2105/PowerTools/x86_64/os/Packages/asio-devel-1.10.8-7.module_el8.3.0+757+d382997d.x86_64.rpm
dnf -y install asio-devel-1.10.8-7.module_el8.3.0+757+d382997d.x86_64.rpm
scl enable gcc-toolset-9 bash

git clone https://github.com/Project-OSRM/osrm-backend.git
cd osrm-backend
mkdir build
cd build

cmake3 .. -DENABLE_MASON=ON -DCMAKE_CXX_COMPILER=/opt/rh/gcc-toolset-9/root/usr/bin/g++
make
make install

cd ..
wget -c http://download.geofabrik.de/europe/great-britain-latest.osm.pbf -P /gbooking/osrm-backend
osrm-extract great-britain-latest.osm.pbf --threads=10
osrm-partition great-britain-latest.osrm
osrm-customize great-britain-latest.osrm
osrm-routed --algorithm=MLD --max-table-size=1000  great-britain-latest.osrm

firewall-cmd --permanent --zone=public --add-port=9966/tcp
firewall-cmd --permanent --zone=public --add-port=5000/tcp

adduser osrm -s /sbin/nologin
echo '[Unit]
Description=Open Source Routing Machine
Wants=network-online.target
After=network.target network-online.target

[Service]
ExecStart=/usr/local/bin/osrm-routed --algorithm=MLD --max-table-size=10000  /osrm/britain-and-ireland-latest.osrm
User=osrm
Group=osrm
Restart=always
RestartSec=5s

[Install]
WantedBy=multi-user.target
' >/etc/systemd/system/osrm_routed.service

exit



### hmm, checking
dnf -qy module disable postgresql
dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-8-x86_64/pgdg-redhat-repo-latest.noarch.rpm
export PATH=/usr/pgsql-12/bin/:$PATH

dnf --enablerepo=powertools install -y postgresql12-server \
                    postgresql12-contrib postgresql12-devel postgis30_12 \
                    wget git cmake make gcc gcc-c++ libtool policycoreutils-python-utils \
                    llvm-toolset ccache clang-tools-extra \
                    php-pgsql php php-intl php-json libpq-devel \
                    bzip2-devel proj-devel boost-devel \
                    python3-pip python3-setuptools python3-devel \
                    expat-devel zlib-devel libicu-devel

cd /gbooking
git clone https://github.com/Project-OSRM/osrm-frontend.git
cd osrm-frontend
docker build . -f docker/Dockerfile -t osrm-frontend
docker run -i -p 0.0.0.0:9966:9966 -e OSRM_BACKEND='http://178.79.173.152:5000' osrm-frontend



### use -d for a daemon
#docker run -i -p 0.0.0.0:9966:9966 osrm/osrm-frontend













VROOOOM!

Skills:
  Black cab
  Wheelchair 
  Executive
  Airport
  7 seater
  Long distance
  *Collect and deliver
  *Collect, shop and deliver
  *Ride sharing

* future



What about regulating income across the entire fleet to a certain extent?  Configurable. 
We can track taxi miles driven across an entire hour or 1/2 hour. We only then compare with other taxis who have an entire hour.
We take offered jobs into account that were rejected.
We work out an average, and anyone below that average gets priority.
People above the average do not... so the seems always works out an overall average but this does not penalise drivers whom have made more than the average.
We display that average to the taxi drivers.
