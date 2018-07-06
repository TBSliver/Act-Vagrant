#!/usr/bin/env bash

curl -L https://raw.githubusercontent.com/tokuhirom/Perl-Build/master/perl-build | perl - -Duseshrplib 5.12.5 /opt/perl-5.12/

curl -L https://cpanmin.us | /opt/perl-5.12/bin/perl - App::cpanminus
/opt/perl-5.12/bin/cpanm LWP::UserAgent Apache::Test
