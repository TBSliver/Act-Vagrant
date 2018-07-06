#!/usr/bin/env bash

curl -L https://raw.githubusercontent.com/tokuhirom/Perl-Build/master/perl-build | perl - -Duseshrplib 5.12.5 /opt/perl-5.12/

/opt/perl-5.12/bin/cpan install LWP::UserAgent Apache::Test
