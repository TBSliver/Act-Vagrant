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

## Setup

To use this, you will need to set up a couple of other repos - this repository only includes the code for spinning up an environment which can run the codebase. The basic layout is:

```
Parent Folder
|-- Act-Vagrant (This repo)
|-- Act (The main Act codebase)
|-- conferences
    |-- tpc-2018-glasgow
    |-- tpc-2017-amsterdam
    ...
```

to set this up, the following commands will suffice (A setup script will be incoming eventually when things settle down).

```
mkdir Act-Dev
cd Act-Dev
git clone $Act-Vagrant
git clone git@github.com:book/Act.git
mkdir conferences
git clone git@github.com:Act-Conferenes/tpc-2018-glasgow.git conferences/tpc-2018-glasgow
```

The Act, and conferences folders get mounted into the VM as required, so must be present.
