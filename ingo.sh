#!/bin/bash
if [ $# -eq 0 ]; then
  echo "No version supplied..."
  echo "Usage:"   
  echo "Install specific version: ingo <go-version>"
  echo "Example:                  ingo 1.21.5"
  echo "Install latest version:   ingo --lastest"
  echo "Install latest version:   ingo -l"
  exit 1
fi
version=$1
os=$(uname | tr 'A-Z' 'a-z')
machine=$(uname -m)

# needs check if go is allready installed
if !go version &> /dev/null; then 
  currentversion="-1";
else
  currentversion=$(go version | grep -oP '[0-9]\.[0-9]*\.[0-9]')
fi

newestversion=$(curl 'https://go.dev/VERSION?m=text' | grep -oP '[0-9]\.[0-9]*\.[0-9]')

if [ $version = "--latest" ] || [ $version = "-l" ]; then
  version=$newestversion
fi

if [ $currentversion = $version ]; then
  echo "Version already installed"
  exit 0
fi

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
  echo "export PATH=\$PATH:/usr/local/go/bin" >> ~/.profile
  source ~/.profile
  go version
  if [ $? -ne 0 ]; then
    echo "Something went wrong installing go, try again..."
    exit 1
  fi
fi
