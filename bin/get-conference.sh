#! /bin/bash

CONF=$1;

cd conferences

git clone git@github.com:Act-Conferences/$CONF\.git

cd ..

cd Act

mkdir -p actdocs

cd actdocs

ln -s ../../conferences/$CONF/actdocs $CONF

cd ..
cd wwwdocs

ln -s ../../conferences/$CONF/wwwdocs $CONF

cd ../..
