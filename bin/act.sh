#!/usr/bin/env bash

PERL_PREFIX=/opt/perl-5.12/bin

PERL=$PERL_PREFIX/perl
CPAN=$PERL_PREFIX/cpan
CPANM=$PERL_PREFIX/cpanm

sudo $CPANM Module::Install

cd /act

sudo $CPANM --installdeps .

export PGPASSWORD=act
ACTHOME=$HOME /opt/perl-5.12/bin/perl -Ilib bin/dbinit | psql -U act act
/opt/perl-5.12/bin/wiki-toolkit-setupdb --type postgres --name actwiki --user act --pass act

cd ~

# All the files that need symlinking in
mkdir -p wwwdocs/photos
mkdir actdocs
ln -s /act/po po
ln -s /act/templates templates
ln -s /act/wwwdocs/* wwwdocs/

ln -s /vagrant/etc/conf conf

# Conference specific
/vagrant/etc/mount-conferences.sh

sudo /usr/local/apache/bin/apachectl start
