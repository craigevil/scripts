#!/bin/bash
PKGDIR="/root/raspbian-addons/debian/pool/"
LATEST=`curl -s https://api.github.com/repos/JoseExposito/touche/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")'`
curl -s https://api.github.com/repos/JoseExposito/touche/releases/latest \
  | grep browser_download_url \
  | grep 'armhf.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o $PKGDIR/touche-$LATEST-armhf.deb

curl -s https://api.github.com/repos/JoseExposito/touche/releases/latest \
  | grep browser_download_url \
  | grep 'arm64.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o $PKGDIR/touche-$LATEST-arm64.deb
