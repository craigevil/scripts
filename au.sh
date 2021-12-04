#!/bin/bash

# define variables
PKGDIR="/root/raspbian-addons/debian/pool/"
PKGDIRA="/root/raspbian-addons/debian/"
GPGPATH="/root/gpgpass"
EMAILPATH="/root/email"
DATEA="$(date)"

echo $DATEA

function error {
  echo -e "\e[91m$1\e[39m"
  exit 1
}

if [ ! -f ${GPGPASS} ]; then
  error "gpg file not detected"
fi

if [ ! -f ${EMAIL} ]; then
  error "email file not detected"
fi

mkdir -p ~/dlfiles
cd ~/dlfiles
rm -rf *

echo "Updating VSCodium"
LATEST=`curl -s https://api.github.com/repos/VSCodium/VSCodium/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")'`
curl -s https://api.github.com/repos/VSCodium/VSCodium/releases/latest \
  | grep browser_download_url \
  | grep 'armhf.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o codium-$LATEST-armhf.deb || error "Failed to download the codium:armhf"

curl -s https://api.github.com/repos/VSCodium/VSCodium/releases/latest \
  | grep browser_download_url \
  | grep 'arm64.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o codium-$LATEST-arm64.deb || error "Failed to download codium:arm64"

rm $PKGDIR/codium-* || rm $PKGDIR/codium_*

mv codium* $PKGDIR

echo "Updating Goreleaser"
LATEST=`curl -s https://api.github.com/repos/goreleaser/goreleaser/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")'`
curl -s https://api.github.com/repos/goreleaser/goreleaser/releases/latest \
  | grep browser_download_url \
  | grep 'armhf.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o goreleaser-$LATEST-armhf.deb || error "Failed to download goreleaser:armhf"

curl -s https://api.github.com/repos/goreleaser/goreleaser/releases/latest \
  | grep browser_download_url \
  | grep 'arm64.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o goreleaser-$LATEST-arm64.deb || error "Failed to download goreleaser:arm64"

rm $PKGDIR/goreleaser-* || rm $PKGDIR/goreleaser_*

mv goreleaser* $PKGDIR

echo "Updating hyperfine"
LATEST=`curl -s https://api.github.com/repos/sharkdp/hyperfine/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")'`
curl -s https://api.github.com/repos/sharkdp/hyperfine/releases/latest \
  | grep browser_download_url \
  | grep 'armhf.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o hyperfine-$LATEST-armhf.deb || error "Failed to download hyperfine:armhf"

curl -s https://api.github.com/repos/sharkdp/hyperfine/releases/latest \
  | grep browser_download_url \
  | grep 'arm64.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o hyperfine-$LATEST-arm64.deb || error "Failed to download hyperfine:arm64"

rm $PKGDIR/hyperfine-* || rm $PKGDIR/hyperfine_*

mv hyperfine* $PKGDIR

echo "Updating howdy"
LATEST=`curl -s https://api.github.com/repos/boltgolt/howdy/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")'`
curl -s https://api.github.com/repos/boltgolt/howdy/releases/latest \
  | grep browser_download_url \
  | grep '.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o howdy-$LATEST-all.deb || error "Failed to download howdy:all!"

rm $PKGDIR/howdy-* || rm $PKGDIR/howdy_*

mv howdy* $PKGDIR

echo "Updating pacstall"
LATEST=`curl -s https://api.github.com/repos/pacstall/pacstall/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")'`
curl -s https://api.github.com/repos/pacstall/pacstall/releases/latest \
  | grep browser_download_url \
  | grep '.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o pacstall-$LATEST-all.deb || error "Failed to download pacstall:all!"

rm $PKGDIR/pacstall-* || rm $PKGDIR/pacstall_*

mv pacstall* $PKGDIR

echo "Updating croc"
LATEST=`curl -s https://api.github.com/repos/schollz/croc/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")'`
curl -s https://api.github.com/repos/schollz/croc/releases/latest \
  | grep browser_download_url \
  | grep 'ARM.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o croc-$LATEST-armhf.deb || error "Failed to download croc:armhf"

curl -s https://api.github.com/repos/schollz/croc/releases/latest \
  | grep browser_download_url \
  | grep 'ARM64.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o croc-$LATEST-arm64.deb || error "Failed to download croc:arm64"

rm $PKGDIR/croc-* || rm $PKGDIR/croc_*

mv croc* $PKGDIR

echo "Updating turbowarp-deskop"
LATEST=`curl -s https://api.github.com/repos/TurboWarp/desktop/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")' | tr -d 'v'`
wget https://github.com/TurboWarp/desktop/releases/download/v${LATEST}/TurboWarp-linux-arm64-${LATEST}.deb -O turbowarp-desktop_${LATEST}_arm64.deb || error "Failed to download turbowarp-desktop:arm64!"
wget https://github.com/TurboWarp/desktop/releases/download/v${LATEST}/TurboWarp-linux-armv7l-${LATEST}.deb -O turbowarp-desktop_${LATEST}_armhf.deb || error "Failed to download turbowarp-desktop:armhf!"

rm $PKGDIR/turbowarp-desktop-* || rm $PKGDIR/turbowarp-desktop_*

mv turbowarp* $PKGDIR

echo "Updating croc"
LATEST=`curl -s https://api.github.com/repos/cdr/code-server/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")'`
curl -s https://api.github.com/repos/cdr/code-server/releases/latest \
  | grep browser_download_url \
  | grep 'armhf.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o code-server-$LATEST-armhf.deb || error "Failed to download code-server:armhf"

curl -s https://api.github.com/repos/cdr/code-server/releases/latest \
  | grep browser_download_url \
  | grep 'arm64.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o code-server-$LATEST-arm64.deb || error "Failed to download code-server:arm64"

rm $PKGDIR/code-server-* || rm $PKGDIR/code-server_*

mv code-server* $PKGDIR

echo "Updating electron-fiddle"
LATEST=`curl -s https://api.github.com/repos/electron/fiddle/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")'`
curl -s https://api.github.com/repos/electron/fiddle/releases/latest \
  | grep browser_download_url \
  | grep 'armhf.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o electron-fiddle-$LATEST-armhf.deb || error "Failed to download electron-fiddle:armhf"

curl -s https://api.github.com/repos/electron/fiddle/releases/latest \
  | grep browser_download_url \
  | grep 'arm64.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o electron-fiddle-$LATEST-arm64.deb || error "Failed to download electron-fiddle:arm64"

rm $PKGDIR/electron-fiddle-* || rm $PKGDIR/electron-fiddle_*

mv electron-fiddle* $PKGDIR

echo "Updating papirus-icon-theme"
if [ ! -f "/etc/apt/sources.list.d/papirus-icon-theme.list" ]; then
	echo "papirus-icon-theme.list does not exist. adding repo..."
  	echo "deb http://ppa.launchpad.net/papirus/papirus/ubuntu bionic main" | sudo tee /etc/apt/sources.list.d/papirus-icon-theme.list
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9461999446FAF0DF770BFC9AE58A9D36647CAE7F || error "Failed to add papirus repo key"
	sudo apt update
fi
echo "papirus-icon-theme.list exists. continuing..."
sudo apt update
apt download papirus-icon-theme

rm $PKGDIR/papirus-icon-theme_* || rm $PKGDIR/papirus-icon-theme-*

mv papirus-icon-theme* $PKGDIR

echo "Updating lazygit"
if [ ! -f "/etc/apt/sources.list.d/lazygit.list" ]; then
	echo "lazygit.list does not exist. adding repo..."
  	echo "deb http://ppa.launchpad.net/lazygit-team/release/ubuntu hirsute main" | sudo tee /etc/apt/sources.list.d/lazygit.list
	sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 68CCF87596E97291 || error "Failed to add lazygit repo key"
fi
echo "lazygit.list exists. continuing..."
sudo apt update
apt download lazygit:arm64
apt download lazygit:armhf

rm $PKGDIR/lazygit_* || rm $PKGDIR/lazygit-*

mv lazygit* $PKGDIR

echo "updating webcord"
LATEST=`curl -s https://api.github.com/repos/SpacingBat3/WebCord/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")'`
curl -s https://api.github.com/repos/SpacingBat3/WebCord/releases/latest \
  | grep browser_download_url \
  | grep 'armhf.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o webcord-$LATEST-armhf.deb || error "Failed to download webcord:armhf"

curl -s https://api.github.com/repos/SpacingBat3/WebCord/releases/latest \
  | grep browser_download_url \
  | grep 'arm64.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o webcord-$LATEST-arm64.deb || error "Failed to download webcord:arm64"

rm $PKGDIR/webcord-* || rm $PKGDIR/webcord_*

mv webcord* $PKGDIR

echo "Updating gh"

LATEST=`curl -s https://api.github.com/repos/cli/cli/releases/latest | grep -oP '"tag_name": "\K(.*)(?=")'`
curl -s https://api.github.com/repos/cli/cli/releases/latest \
  | grep browser_download_url \
  | grep 'armv6.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o gh-$LATEST-armhf.deb || error "Failed to download gh:armhf"

curl -s https://api.github.com/repos/cli/cli/releases/latest \
  | grep browser_download_url \
  | grep 'arm64.deb"' \
  | cut -d '"' -f 4 \
  | xargs -n 1 curl -L -o gh-$LATEST-arm64.deb || error "Failed to download gh:arm64"

rm $PKGDIR/gh-* || rm $PKGDIR/gh_*

mv gh* $PKGDIR

echo "Updating tut..."
# script created by azlux. https://packages.azlux.fr/scripts
repo="RasmusLindroth/tut"
api=$(curl --silent "https://api.github.com/repos/$repo/releases/latest")
new=$(echo $api | grep -Po '"tag_name": "\K.*?(?=")')
START="tut"
END="static"
bin_urls=$(echo $api | python -c "import sys; from json import loads as l; x = l(sys.stdin.read()); print(' '.join(s['browser_download_url'] for s in x['assets'] if (s['name'].startswith('$START') and s['name'].endswith('$END'))))")
for bin_url in $bin_urls; do
STARTDIR="/tmp/tut"
DESTDIR="$STARTDIR/pkg"
OUTDIR="$STARTDIR/deb"
rm -rf "$STARTDIR"
mkdir "$STARTDIR"
wget -q $bin_url -O "$STARTDIR/tut"
install -Dm 755 "$STARTDIR/tut" "$DESTDIR/usr/bin/tut"
mkdir -p "$DESTDIR/DEBIAN"
archi=$(echo $bin_url | cut -d '-' -f2)
[ "$archi" == "arm" ] && archi="armhf"
echo "ARCHI - $archi"
cat >"$DESTDIR/DEBIAN/control"<<EOL
Package: tut
Version: $new
Section: net
Priority: optional
Architecture: $archi
Maintainer: Ryan Fortner <ryankfortner@gmail.com>
Description: a Mastodon TUI
Homepage: https://github.com/RasmusLindroth/tut
Bugs: https://github.com/RasmusLindroth/tut/issues
EOL
cat >"$STARTDIR/changelog"<<EOL
package ($new) stable; urgency=medium
  Please check the source repo for the full changelog
  You can find the link at https://apt.raspbian-addons.org/
-- ryanfortner <ryankfortner@gmail.com>  $(date -R)
EOL
install -Dm 644 "$STARTDIR/changelog" "$DESTDIR/usr/share/doc/tut/changelog.Debian"
gzip "$DESTDIR/usr/share/doc/tut/changelog.Debian"
rm -rf "$OUTDIR"
mkdir  "$OUTDIR"
dpkg-deb --build "$DESTDIR" "$OUTDIR"
rm $PKGDIR/tut-* || rm $PKGDIR/tut_*
mv ${OUTDIR}/tut*.deb $PKGDIR
rm -rf "$STARTDIR"

cd $PKGDIRA
echo "Writing packages..."
EMAIL="$(cat /root/email)"
GPGPASS="$(cat /root/gpgpass)"
rm InRelease Release Release.gpg Packages Packages.gz
dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages
apt-ftparchive release . > Release
gpg --default-key "${EMAIL}" --batch --pinentry-mode="loopback" --passphrase="$GPGPASS" -abs -o - Release > Release.gpg
gpg --default-key "${EMAIL}" --batch --pinentry-mode="loopback" --passphrase="$GPGPASS" --clearsign -o - Release > InRelease
echo "Repository successfully updated."
