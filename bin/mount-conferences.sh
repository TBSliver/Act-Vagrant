#! /bin/bash

OLD_DIR=`pwd`

cd ~

for conf in /conferences/*
do
  echo $conf
  conf_name=`basename $conf`
  echo $conf_name
  cd actdocs
  if [ ! -e $conf_name ]
  then
    echo "adding actdocs"
    ln -s /$conf/actdocs $conf_name
  fi
  cd ..
  cd wwwdocs
  if [ ! -e $conf_name ]
  then
    echo "adding wwdocs"
    ln -s /$conf/wwwdocs $conf_name
  fi
  cd ..
done

cd $OLD_DIR
