# Act Vagrant

Vagrant box to get Act going

## About

This vagrant box is specifically for getting a running Act instance, on an
up-to-date OS (Ubuntu Xenial at time of writing). The aim of this is to have a
development environment, for updating Act to latest Apache and mod perl at
minimum - but also to have somewhere that improvements can be done. This is
mainly as the other vagrant boxes are running a modified version of Act, rather
than the version deployed to production at present. Also the current vagrant
options are using a custom OS image, which limits updating and fixing issues on
the box...

## Requirements

* Git
* Vagrant > 2.0
* VirtualBox (Or another vagrant compatible VM system)

## Setup

To use this, you will need to set up a couple of other repos - this repository
only includes the code for spinning up an environment which can run the
codebase. The basic layout is:

```
Parent Folder
|-- Act-Vagrant (This repo)
|-- Act (The main Act codebase)
|-- conferences
    |-- tpc-2018-glasgow
    |-- tpc-2017-amsterdam
    ...
```

to set this up, the following commands will suffice (A setup script will be
  incoming eventually when things settle down).

```
mkdir Act-Dev
cd Act-Dev
git clone $Act-Vagrant
git clone git@github.com:book/Act.git
mkdir conferences
git clone git@github.com:Act-Conferences/tpc-2018-glasgow.git conferences/tpc-2018-glasgow
git clone git@github.com:Act-Conferences/tpc-2017-amsterdam.git conferences/tpc-2017-amsterdam
```

The `Act` and `conferences` folders get mounted into the VM as required, so
must be present.

The last step is to modify the list of conferences in `etc/conf/act.ini` in
this repo. So, using the two conferences we specified earlier, change the line
to:

```
conferences = tpc-2018-glasgow tpc-2017-amsterdam
```

## Usage

To get the basic Act set up, and assuming you have your conferences set up as
required in setup, then the whole thing will start as needed from running this:

```
vagrant up
```

Then the host can be accessed on `192.168.34.12`.

If you want to run any of the scripts in Act/bin, then you will need to set the
ACTHOME variable. For example, running the database upgrade script:

```
vagrant ssh
cd /act
ACTHOME=$HOME /opt/perl-5.12/bin/perl -Ilib bin/dbupgrade
```

Note as well that you need to run the scripts with the custom built perl in
`/opt/perl-5.12`.

To restart apache (after a change in Act for example) then use the apachectl
script with the custom built apache:

```
sudo /usr/local/apache/bin/apachectl stop
sudo /usr/local/apache/bin/apachectl start
```

Note that using the restart command does not reload changes to Act properly

# Credits

Some items copied from `Act Out of the Box` from THEMA MEDIA and Act Voyager,
so see credits on those repos (Will copy them here at some point)
