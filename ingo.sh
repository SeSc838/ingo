#!/bin/bash
if [ $# -eq 0 ]; then
  echo "No version supplied..."
  echo "Usage:   ingo <go-version>"
  echo "Example: ingo 1.21.5"
  exit 1
fi
version=$1
os=$(uname | tr 'A-Z' 'a-z')
machine=$(uname -m)

if [ $os -ne "linux" ]; then
  echo "Script only working on linux..."
  exit 1
fi

case $machine in
  "x86_64")
    arch="amd64";
  ;;
  "x86")
    arch="386";
  ;;
  "aarch64")
    arch="arm64"
  ;;
  *)
    echo "Architecture not yet implemented, sorry..."
    exit 1
esac

wget https://go.dev/dl/go$version.$os-$arch.tar.gz

sudo  rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go$version.$os-$arch.tar.gz

rm go$version.$os-$arch.tar.gz

go version

if [ $? -ne 0 ]; then
  echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.profile
  source ~/.profile
  go version
  if [ $? -ne 0 ]; then
    echo "Something went wrong installing go, try again..."
    exit 1
  fi
fi
