#!/bin/sh

# $1 is the sonar.login token

set -e

# This job is run directly after mon-web-unittest on centos7.
VERSION=0.1

if [ -z "$VERSION" ] ; then
  echo "You need to specify the VERSION variable"
  exit 1
fi

echo "debug"
ls -la

sonar-scanner -Dsonar.projectVersion="$VERSION" -Dsonar.login="$1" -Dsonar.host.url="$2"
