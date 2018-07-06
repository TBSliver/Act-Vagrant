#! /usr/bin/env bash

apt-get update
apt-get -y install \
  language-pack-en \
  curl \
  build-essential

# make /bin/sh symlink to bash instead of dash:
echo "dash dash/sh boolean false" | debconf-set-selections
DEBIAN_FRONTEND=noninteractive dpkg-reconfigure dash
