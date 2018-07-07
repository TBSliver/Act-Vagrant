#! /usr/bin/env bash

mkdir apache-build
cd apache-build

wget https://archive.apache.org/dist/httpd/apache_1.3.42.tar.gz
wget https://www.apache.org/dist/perl/mod_perl-1.31.tar.gz
wget https://archive.apache.org/dist/httpd/libapreq/libapreq-1.34.tar.gz

tar xf apache_1.3.42.tar.gz
tar xf mod_perl-1.31.tar.gz
tar xf libapreq-1.34.tar.gz

# Thank you Theo for a useful patch! :D
patch -p0 < /vagrant/etc/apache_1.3.42.patch

cd mod_perl-1.31

/opt/perl-5.12/bin/perl Makefile.PL APACHE_SRC=../apache_1.3.42/src DO_HTTPD=1 USE_APACI=1 EVERYTHING=1 APACI_ARGS=--enable-module=so
make EXTRA_CFLAGS+="-std=gnu89"
make EXTRA_CFLAGS+="-std=gnu89" test
sudo make EXTRA_CFLAGS+="-std=gnu89" install

cd ../apache_1.3.42

sudo make EXTRA_CFLAGS+="-std=gnu89" install

PATH=$PATH:/usr/local/apache/bin

cd ../libapreq-1.34

/opt/perl-5.12/bin/perl Makefile.PL
make CCFLAGS+="-std=gnu89"
sudo make CCFLAGS+="-std=gnu89" install

echo 'Include "/vagrant/etc/httpd.conf"' | sudo tee --append /usr/local/apache/conf/httpd.conf

sudo sed -i "s/^\(User\|Group\).*$/\1 $USER/" /usr/local/apache/conf/httpd.conf
