#!/bin/bash
# This shell script is used to build rpm for kwplayer
# Released by wangjiezhe <wangjiezhe@gmail.com>

if [ $# -ne 2 ]
then
	echo "Usage: $(basename "$0") version release"
	exit 2
fi

version=${1//-/.}
release=$2

if [ ! -d  "$HOME"/rpmbuild/SPECS ]
then
	if [ -n "$(which rpmdev-setuptree)" ]
	then
		rpmdev-setuptree
	else
		echo "The command \`rpmdev-setuptree\` doesn't in your path.'"
		echo "Please check you path or if your have installed package development tools."
		echo "If not, install the core development tools:"
		echo "yum install @development-tools"
		echo "yum install fedora-packager"
		exit 1
	fi
fi

# Replace these variables by your pathes
GIT="$HOME"/Downloads/github/wangjiezhe/kwplayer
DEST="$HOME"/Downloads/github/wangjiezhe/kwplayer-packages

SOURCES="$HOME"/rpmbuild/SOURCES
SPECS="$HOME"/rpmbuild/SPECS
RPMS="$HOME"/rpmbuild/RPMS/noarch
SRPMS="$HOME"/rpmbuild/SRPMS

if [ ! -f "$SPECS"/bcloud.spec ]
then
	cp "$PWD"/bcloud.spec "$SPECS"
fi

mkdir -p "$SOURCES"/kwplayer-"$version"
cd "$GIT"/
cp -vr HISTORY LICENSE README.md setup.py kwplayer kuwo po share "$SOURCES"/kwplayer-"$version"
# rm -rf "$SOURCES"/kwplayer-$version/kuwo/__pycache__/

cd "$SOURCES"/
tar -cvzf kwplayer-"$version".tar.gz kwplayer-"$version"
rm -rf kwplayer-"$version"

cd "$SPECS"/
sed -i -e "/^Version/s/[0-9]\+\.[0-9]\+\.[0-9]\+/$version/" kwplayer.spec
sed -i -e "/^Release/s/[0-9]\+/$release/" kwplayer.spec
rpmbuild -ba kwplayer.spec
cp kwplayer.spec "$DEST"/build_rpm/
# cp makerpm-kwplayer.sh "$DEST"/build_rpm/

cp "$RPMS"/kwplayer-"$version"-"$release".fc20.noarch.rpm "$DEST"/
cp "$SRPMS"/kwplayer-"$version"-"$release".fc20.src.rpm "$DEST"/build_rpm/
