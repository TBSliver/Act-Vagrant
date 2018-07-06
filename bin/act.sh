#!/usr/bin/env bash

PERL_PREFIX=opt/perl-5.12/bin

PERL=$PERL_PREFIX/perl
CPAN=$PERL_PREFIX/cpan
CPANM=$PERL_PREFIX/cpanm

sudo $CPANM Module::Install

cd /vagrant/Act

sudo $CPANM --installdeps .

ACTHOME=/vagrant/ACTHOME /opt/perl-5.12/bin/perl -Ilib bin/dbinit | sudo -u postgres psql act
