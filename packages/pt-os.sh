
PKGDIR="/home/pi/raspbian-addons/debian/pool/"
LATEST=`curl -s https://api.github.com/repos/pi-top/pi-topOS-Core-Packages/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")' | tr -d 'v'`
wget https://github.com/pi-top/pi-topOS-Core-Packages/releases/download/v${LATEST}/pt-os_${LATEST}_all.deb -O $PKGDIR/pt-os_${LATEST}_all.deb
